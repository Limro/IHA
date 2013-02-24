using System.Windows;
using Microsoft.Practices.Prism.Modularity;

namespace LAB8.Shell
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            try
            {
                base.OnStartup(e);
                var bootstrapper = new Bootstrapper();
                bootstrapper.Run();
            }
            catch (ModuleTypeLoaderNotFoundException ex)
            {
                var result = MessageBox.Show(ex.Message, "Module Loading Error", MessageBoxButton.OK);
                if (result == MessageBoxResult.OK)
                    Application.Current.Shutdown();

            }
        }
    }
}
