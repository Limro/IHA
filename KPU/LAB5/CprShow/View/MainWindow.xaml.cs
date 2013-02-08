using System.Windows;
using CprDll;

namespace CprShow.View
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            _check = new CprCheck();
            InitializeComponent();
        }

        private readonly CprCheck _check;


        private void CheckClick(object sender, RoutedEventArgs e)
        {
            var input = CprInput.Text;
            CprError error;
            _check.Check(input, out error);

            CprErrorBlock.Text = error.ToString();
        }
    }
}
