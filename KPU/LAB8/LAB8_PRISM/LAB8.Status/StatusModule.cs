using LAB8.Infrastructure.Interfaces;
using Microsoft.Practices.Prism.Modularity;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.Unity;

namespace LAB8.Status
{
    public class StatusModule : IModule
    {
        private readonly IUnityContainer _container;
        private readonly IRegionManager _manager;

        public StatusModule(IUnityContainer container, IRegionManager manager)
        {
            _container = container;
            _manager = manager;
            RegisterServicesAndViews();
        }

        private void RegisterServicesAndViews()
        {
            _container.RegisterType<StatusView>();
        }

        public void Initialize()
        {
            var view = _container.Resolve<StatusView>();
            var region = _manager.Regions[RegionNames.StatusRegion];
            region.Add(view);
        }
    }
}
