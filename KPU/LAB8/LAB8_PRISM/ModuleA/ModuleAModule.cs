using LAB8.Infrastructure;
using LAB8.Menu.MenuView;
using Microsoft.Practices.Prism.Modularity;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.Unity;

namespace ModuleA
{
    public class ModuleAModule : IModule
    {
        private readonly IUnityContainer _container;
        private readonly IRegionManager _manager;

        public ModuleAModule(IUnityContainer container, IRegionManager manager)
        {
            _container = container;
            _manager = manager;
            RegisterServicesAndViews();
        }

        private void RegisterServicesAndViews()
        {
            //_container.RegisterType<MenuView.MenuView>();
        }

        public void Initialize()
        {
            //var view = _container.Resolve<MenuView.MenuView>();
            //var region = _manager.Regions[RegionNames.MainRegion];
            //region.Add(view);
        }
    }
}
