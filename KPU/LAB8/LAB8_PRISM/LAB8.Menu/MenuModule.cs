using LAB8.Infrastructure.Interfaces;
using Microsoft.Practices.Prism.Modularity;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.Unity;

namespace LAB8.Menu
{
    public class MenuModule : IModule
    {
        private readonly IUnityContainer _container;
        private readonly IRegionManager _manager;

        public MenuModule(IUnityContainer container, IRegionManager manager)
        {
            _container = container;
            _manager = manager;
            RegisterServicesAndViews();
        }

        private void RegisterServicesAndViews()
        {
            _container.RegisterType<MenuView.MenuView>();
        }

        public void Initialize()
        {
            var view = _container.Resolve<MenuView.MenuView>();
            var region = _manager.Regions[RegionNames.MenuRegion];
            region.Add(view);
        }
    }
}
