
import wx.wx;

    /**
     * Class to display a list of images.  The scrolled окно helps us with
     * managing scrollbars when the окно's contents are too large to be
     * displayed.
     */
    public class ImageList : ScrolledWindow
    {
        private ImageViewer m_viewer;

        /**
         * Устs up the рисунок list.
         *
         * The base class is initialized with a default окно position,
         * and a static Размер of ширь = 150, The '-1' for высь means that
         * the высь of the окно is unconstrained.
         */
        public this(Окно родитель, ImageViewer viewer)
        {
            super(родитель, -1, ДЕФПОЗ, Размер(140, -1));
            m_viewer = viewer;

            // A flex grid сайзер will be used to align the images горизонтально.
            // This is used, because the flex grid allows for entries to be
            // of various размы.
            FlexGridSizer сайзер = new FlexGridSizer(1, 0, 0);

            // For now, our сайзер will remain empty until images are loaded.

            Перемерщик = сайзер;

            // Инициализируй the scrollbars
            УстScrollbars(0, 1, 0, 0);
        }

        /**
         * Lists the images in the given list of рисунок file names.
         */
        public проц ListImages(ткст[] images)
        {
            // Clear our list
            ClearImages();

            // Добавь the images
		    Console.WriteLine("Adding images ...");
            foreach(ткст imageFile; images) {

				Console.WriteLine("   + " ~ imageFile);
                // Создай a thumbnail will display the рисунок
                Thumbnail thumb = new Thumbnail(this, imageFile);
                
                // Hook in our event обработчик
                thumb.ThumbnailClicked = 
                    new Thumbnail.ThumbnailClick(OnThumbnailClicked);

                // Добавь the битмап button to the сайзер.
                Перемерщик.Добавь(thumb, 1, Stretch.wxEXPAND);

                // A horizontal static строка is used to help seperate the 
                // images in the list.
                StaticLine строка = new StaticLine(this, -1, ДЕФПОЗ, 
                                                 вхДефРазм, 
                                                 StaticLine.wxLI_HORIZONTAL);

                // The static строка is added with a small бордюр on the bottom
                Перемерщик.Добавь(строка, 0, Stretch.wxEXPAND | Direction.wxBOTTOM, 3);

                // Встрой inside tells the scrolled окно to reset the scrollbars,
                // so that the entire окно's contents can be scrolled.
                ВстройВнутрь();
            }

            m_viewer.Битмап = null;
        }

        /**
         * Clear all the images in the list.
         */
        private проц ClearImages()
        {
            // This will remove all the windows (images) that are in the сайзер.
            // 
            // The 'да' параметр tells the сайзер to delete the windows as
            // well.  If 'false' were given, we would have to manually do 
            // this.
            Перемерщик.Clear(да);

            System.GC.Collect();
        }

        public проц OnThumbnailClicked(ткст имяф, Битмап bmp)
        {
            m_viewer.Битмап = bmp;

            // Уст the main рамка's титул
            родитель.родитель.Титул = имяф;
        }
    }
