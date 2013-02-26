using System.Windows;

namespace Part_1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            SetupComboBox();
        }

        private void SetupComboBox()
        {
            Comb1.Content = "Add";
            Comb2.Content = "test2";
        }
    }
}
