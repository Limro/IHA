using LAB8.Infrastructure;
using LAB8.LogModule.Log;
using Microsoft.Practices.Prism.Modularity;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.Unity;

namespace LAB8.LogModule
{
    public class LogModule : IModule 
    {
        private readonly IUnityContainer _container;
        private readonly IRegionManager _manager;

        public LogModule(IUnityContainer container, IRegionManager manager)
        {
            _container = container;
            _manager = manager;
            RegisterServicesAndViews();
        }

        private void RegisterServicesAndViews()
        {
            _container.RegisterType<LogView>();
            _container.RegisterType<LogViewModel>();
        }

        public void Initialize()
        {
            var view = _container.Resolve<LogView>();
            var region = _manager.Regions[RegionNames.LogRegion];
            region.Add(view);
        }
    }
}
