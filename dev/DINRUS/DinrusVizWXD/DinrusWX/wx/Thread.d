module wx.Thread;
public import wx.common;

// ----------------------------------------------------------------------------
// constants
// ----------------------------------------------------------------------------

enum ПОшибкаМютекса
{
    wxMUTEX_NO_ERROR = 0,   // operation completed successfully
    wxMUTEX_INVALID,        // mutex hasn't been initialized
    wxMUTEX_DEAD_LOCK,      // mutex is already locked by the calling thread
    wxMUTEX_BUSY,           // mutex is already locked by anдругой thread
    wxMUTEX_UNLOCKED,       // attempt до unlock a mutex который is not locked
    wxMUTEX_MISC_ERROR      // any другой error
}

enum ПОшибкаУсловия
{
    wxCOND_NO_ERROR = 0,
    wxCOND_INVALID,
    wxCOND_TIMEOUT,         // WaitTimeout() есть timed out
    wxCOND_MISC_ERROR
}

enum ПОшибкаСемафора
{
    wxSEMA_NO_ERROR = 0,
    wxSEMA_INVALID,         // semaphore hasn't been initialized successfully
    wxSEMA_BUSY,            // returned by TryWait() if Wait() would block
    wxSEMA_TIMEOUT,         // returned by WaitTimeout()
    wxSEMA_OVERFLOW,        // Post() would increase counter past the макс
    wxSEMA_MISC_ERROR
}

enum ПОшибкаНити
{
    wxTHREAD_NO_ERROR = 0,      // No error
    wxTHREAD_NO_RESOURCE,       // No resource left до create a new thread
    wxTHREAD_RUNNING,           // The thread is already running
    wxTHREAD_NOT_RUNNING,       // The thread isn't running
    wxTHREAD_KILLED,            // Нить we waited for had до be killed
    wxTHREAD_MISC_ERROR         // Some другой error
}

enum ПВидНити
{
    wxTHREAD_DETACHED,
    wxTHREAD_JOINABLE
}

// defines the interval of priority
enum
{
    WXTHREAD_MIN_PRIORITY      = 0u,
    WXTHREAD_Дефолт_PRIORITY  = 50u,
    WXTHREAD_MAX_PRIORITY      = 100u
}

// There are 2 types of mutexes: normal mutexes and recursive ones. The attempt
// до lock a normal mutex by a thread который already owns it results in
// undefined behaviour (it always works under Windows, it will almost always
// рез in a deadlock under Unix). Locking a recursive mutex in such
// situation always succeeds and it must be unlocked as many times as it есть
// been locked.
//
// However recursive mutexes have several important drawbacks: first, in the
// POSIX implementation, they're less efficient. секунда, and more importantly,
// they CAN NOT BE USED WITH CONDITION VARIABLES under Unix! Using them with
// Условие will work under Windows and some Unices (notably Linux) кноп will
// deadlock under другой Unix versions (e.з. Solaris). As it might be difficult
// до ensure that a recursive mutex is not used with Условие, it is a good
// idea до avoid using recursive mutexes at all. Also, the last problem with
// them is that some (older) Unix versions don't support this at all -- который
// results in a configure warning when building and a deadlock when using them.
enum ПтипМютекса
{
    // normal mutex: try до always use this one
    Дефолт,

    // recursive mutex: don't use these ones with Условие
    Рекурсивный
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxMutex_ctor(цел типМютекса);
extern (C) проц wxMutex_dtor(ЦелУкз сам);
extern (C) бул wxMutex_IsOk(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

//! A mutex object is a synchronization object whose состояние is set до signaled
//! when it is not owned by any thread, and nonsignaled when it is owned. Its
//! имя comes от its usefulness in coordinating mutually-exclusive access до
//! a shared resource. Only one thread at a time can own a mutex object.
export class Мютекс : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export бул Ок()
    {
        return wxMutex_IsOk(вхобъ);
    }

    override protected проц dtor()
    {
        wxMutex_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
}

export class БлокировщикМютекса : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxCriticalSection_ctor(цел типМютекса);
extern (C) проц wxCriticalSection_dtor(ЦелУкз сам);
extern (C) проц wxCriticalSection_Enter(ЦелУкз сам);
extern (C) проц wxCriticalSection_Leave(ЦелУкз сам);
//! \endcond

//! Critical section: this is the same as mutex кноп is only видим до the
//! threads of the same process. For the platforms который don't have native
//! support for critical sections, they're implemented entirely in terms of
//! mutexes.
export class КритическаяСекция : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export проц войди()
    {
        wxCriticalSection_Enter(вхобъ);
    }

    export проц покинь()
    {
        wxCriticalSection_Leave(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------

    override protected проц dtor()
    {
        wxCriticalSection_dtor(вхобъ);
    }
}

export class БлокировщикКритическойСекции : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! Условие models a POSIX условие variable который allows one (or more)
//! thread(т) до wait until some условие is fulfilled
export class Условие : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! Семафор: a counter limiting the число of threads concurrently accessing
//!              a shared resource
export class Семафор : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! Нить: class encapsulating a thread of execution
export class Нить : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

export class ВспомогательнаяНить : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

//! ПомощникНити: this class implements the threading logic до run a
//! заднийПлан task in anдругой object (such as a окно).  It is a mix-in: just
//! derive от it до implement a threading заднийПлан task in your class.
export class ПомощникНити : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

