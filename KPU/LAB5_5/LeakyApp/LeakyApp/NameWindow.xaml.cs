using System.Windows;
using System.Windows.Controls;

namespace LeakyApp
{
    /// <summary>
    /// Interaction logic for NameWindow.xaml
    /// </summary>
    public partial class NameWindow : Window
    {
        float[] emptySpace = new float[17 * 1024 * 1024];
        MainWindow mainWnd = null;

        public NameWindow()
        {
            InitializeComponent();
        }

        public NameWindow(MainWindow main)
        {
            InitializeComponent();
            mainWnd = main;
        }

        ~NameWindow()
        {
            emptySpace = null;
            mainWnd = null;
        }

        public void mainWin_NameChanged(object sender, TextChangedEventArgs e)
        {
            tbxName.Text = mainWnd.tbxName.Text;
        }
    }
}
