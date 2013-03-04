using System.Windows;
using Part_2;

namespace WpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            DataContext = this;

            var pcl = new Class1();
            TextOutput = pcl.TextToShow;
            InitializeComponent();
        }

        public string TextOutput { get; set; }
    }
}
