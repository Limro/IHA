using LAB8.Infrastructure;
using Microsoft.Practices.Prism.Modularity;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.Unity;

namespace LogModule
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
            _container.RegisterType<LogModule>();
        }

        public void Initialize()
        {
            var view = _container.Resolve<LogView>();
            var region = _manager.Regions[RegionNames.LogRegion];
            region.Add(view);
        }
    }
}
