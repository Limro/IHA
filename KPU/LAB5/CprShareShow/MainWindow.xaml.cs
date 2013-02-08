using System;
using System.Windows;
using CprSharedDll;

namespace CprShareShow
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            _check = new CprShareDll();
            InitializeComponent();
        }

        private readonly CprShareDll _check;


        private void CheckClick(object sender, RoutedEventArgs e)
        {
            var input = CprInput.Text;
            CprError error;
            _check.Check(input, out error);

            CprErrorBlock.Text = error.ToString();

            //string dll = "c:\\Windows\\assembly\\CprSharedDll";

            Type asType = _check.GetType();

            NameInput.Text = asType.Name;
            VersionInput.Text = asType.Assembly.ImageRuntimeVersion;
            LocationInput.Text = asType.Assembly.Location;
            GACInput.Text = asType.Assembly.GlobalAssemblyCache.ToString();


        }
    }
}
