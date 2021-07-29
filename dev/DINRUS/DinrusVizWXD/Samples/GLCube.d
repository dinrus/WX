//-----------------------------------------------------------------------------
// wxD/Samples - GLCube.d
//
// A wxD version of the wxWidgets "opengl/cube" sample.
//
// ГСКанвас demo program
// (c) 1998 Julian Smart
//
// (C) 2006 afb <afb.sourceforge.net>
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: GLCube.d,v 1.6 2008/03/03 11:47:07 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

import wx.GLCanvas;

import derelict.opengl.gl;

	public class TestGLCanvas : GLCanvas
	{
		public this(Окно родитель, TestGLCanvas other, цел ид, Точка поз=ДЕФПОЗ, Размер Размер=вхДефРазм, цел стиль=0, ткст имя="TestGLCanvas")
		{
			super(родитель, other ? other.context : null, ид, поз, Размер, стиль, имя);

			собРазмер(&приПеремере);
			собРисование(&OnPaint);
			собСотриФон(&OnEraseBackground);
			собВходВОкно(&OnEnterWindow);
		}

		public this(Окно родитель, цел ид, Точка поз=ДЕФПОЗ, Размер Размер=вхДефРазм, цел стиль=0, ткст имя="TestGLCanvas")
		{
			this(родитель, null, ид, поз, Размер, стиль, имя);
		}

		private бцел gllist = 0;

		private проц Render()
		{
		    if (!context()) return;

			// This is a dummy, to avoid an endless succession of paint messages.
			// OnPaint handlers must always create a wxPaintDC.
			scope wxPaintDC dc = new wxPaintDC(this);

			УстCurrent();

			// Init OpenGL once, кноп after УстCurrent
			if (!init)
			{
				InitGL();
				init = да;
			}

			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();
			glFrustum(-0.5f, 0.5f, -0.5f, 0.5f, 1.0f, 3.0f);
			glMatrixMode(GL_MODELVIEW);
		
			/* очистить color and глубь buffers */
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		
			if( gllist == 0 )
			{
				gllist = glGenLists( 1 );
				glNewList(gllist, GL_COMPILE_AND_EXECUTE );
				/* draw six faces of a cube */
				glBegin(GL_QUADS);
				glNormal3f( 0.0f, 0.0f, 1.0f);
				glVertex3f( 0.5f, 0.5f, 0.5f); glVertex3f(-0.5f, 0.5f, 0.5f);
				glVertex3f(-0.5f,-0.5f, 0.5f); glVertex3f( 0.5f,-0.5f, 0.5f);
		
				glNormal3f( 0.0f, 0.0f,-1.0f);
				glVertex3f(-0.5f,-0.5f,-0.5f); glVertex3f(-0.5f, 0.5f,-0.5f);
				glVertex3f( 0.5f, 0.5f,-0.5f); glVertex3f( 0.5f,-0.5f,-0.5f);
		
				glNormal3f( 0.0f, 1.0f, 0.0f);
				glVertex3f( 0.5f, 0.5f, 0.5f); glVertex3f( 0.5f, 0.5f,-0.5f);
				glVertex3f(-0.5f, 0.5f,-0.5f); glVertex3f(-0.5f, 0.5f, 0.5f);
		
				glNormal3f( 0.0f,-1.0f, 0.0f);
				glVertex3f(-0.5f,-0.5f,-0.5f); glVertex3f( 0.5f,-0.5f,-0.5f);
				glVertex3f( 0.5f,-0.5f, 0.5f); glVertex3f(-0.5f,-0.5f, 0.5f);
		
				glNormal3f( 1.0f, 0.0f, 0.0f);
				glVertex3f( 0.5f, 0.5f, 0.5f); glVertex3f( 0.5f,-0.5f, 0.5f);
				glVertex3f( 0.5f,-0.5f,-0.5f); glVertex3f( 0.5f, 0.5f,-0.5f);
		
				glNormal3f(-1.0f, 0.0f, 0.0f);
				glVertex3f(-0.5f,-0.5f,-0.5f); glVertex3f(-0.5f,-0.5f, 0.5f);
				glVertex3f(-0.5f, 0.5f, 0.5f); glVertex3f(-0.5f, 0.5f,-0.5f);
				glEnd();
		
				glEndList();
			}
			else
			{
				glCallList(gllist);
			}
		
	   		glFlush();
	    	SwapBuffers();
		}
		
		private бул init = false;

		private проц InitGL()
		{
		    УстCurrent();
		
			/* set viewing projection */
			glMatrixMode(GL_PROJECTION);
			glFrustum(-0.5f, 0.5f, -0.5f, 0.5f, 1.0f, 3.0f);
		
			/* position viewer */
			glMatrixMode(GL_MODELVIEW);
			glTranslatef(0.0f, 0.0f, -2.0f);
		
			/* position object */
			glRotatef(30.0f, 1.0f, 0.0f, 0.0f);
			glRotatef(30.0f, 0.0f, 1.0f, 0.0f);
		
			glEnable(GL_DEPTH_TEST);
			glEnable(GL_LIGHTING);
			glEnable(GL_LIGHT0);
		}

		проц OnEnterWindow(Объект отправитель, Событие e)
		{
    		УстФокус();
		}

		проц OnPaint(Объект отправитель, Событие e)
		{
    		e.Skip();
    		Render();
		}

		проц приПеремере(Объект отправитель, Событие e)
		{
			// set GL viewport (not called by ГСКанвас::приПеремере on all platforms...)
			Размер Размер = РазмерКлиента();
		
			if (context())
			{
				УстCurrent();
				glViewport(0, 0, cast(GLint) Размер.Ширь, cast(GLint) Размер.Высь);
			}
		}

		проц OnEraseBackground(Объект отправитель, Событие e)
		{
 		  // Do nothing, to avoid flashing.
		}
    }

	public class MyFrame : Рамка
	{
		enum Cmd { Quit = 1 }

		//---------------------------------------------------------------------

		public this(Окно родитель, ткст титул, Точка поз, Размер Размер, цел стиль=wxDEFAULT_FRAME_STYLE)
		{
			super(родитель, wxID_ANY, титул, поз, Размер, стиль);
			canvas = null;

			// Уст the окно пиктограмма

			пиктограмма = new Пиктограмма("./data/mondrian.png");

			// Уст up the event table

    		собМеню( MenuIDs.wxID_EXIT, &ПоВыходу);
    		собМеню( Cmd.Quit, &ПоВыходу);
    		собМеню( MenuIDs.wxID_NEW, &OnNewWindow);
		}
		
		public static MyFrame CreateWindow(MyFrame parentFrame = null, бул isCloneWindow = false)
		{
			ткст стр = "wxWidgets OpenGL Cube Sample";
   			if (isCloneWindow) стр ~= " - Clone";
 
 		    MyFrame рамка = new MyFrame(null, стр, ДЕФПОЗ,
 		    	/* Размер(400, 300) */ вхДефРазм);

			// Make a menubar
			Меню winMenu = new Меню();
			winMenu.Append(MenuIDs.wxID_EXIT, "&Закрой");
			winMenu.Append(MenuIDs.wxID_NEW, "&Нов");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(winMenu, "&Окно");

			рамка.menuBar = menuBar;

			if (parentFrame)
			{
				рамка.canvas = new TestGLCanvas(рамка, parentFrame.canvas,
					wxID_ANY, ДЕФПОЗ, вхДефРазм );
			}
			else
			{
				рамка.canvas = new TestGLCanvas(рамка, wxID_ANY,
					ДЕФПОЗ, вхДефРазм);
			}
   
			// moved the Рамка sizing to after canvas was added,
			// since otherwise the рамка showed empty on wxMac ?
			рамка.Размер = Размер(400, 300);

   			// показ the рамка
    		рамка.показ(да);

			return рамка;
		}

		//---------------------------------------------------------------------

		public проц ПоВыходу(Объект отправитель, Событие e)
		{
    		// да is to сила the рамка to close
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnNewWindow(Объект отправитель, Событие e)
		{
			CreateWindow(this, да);
		}

		//---------------------------------------------------------------------
	
	
		TestGLCanvas canvas;
	}

	public class GLCube : Приложение
	{
		//---------------------------------------------------------------------

		public override бул поИниц()
		{
   			 // Создай the main рамка окно
			MyFrame.CreateWindow(null);

			return да;
		}

		//---------------------------------------------------------------------

		static проц Main()
		{
			GLCube app = new GLCube();
			app.пуск();
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	GLCube.Main();
	return 0;
}
