namespace LAB8.Infrastructure.Interfaces
{
    public enum ModuleName { Log, ModuleA, ModuleB, ModuleC, ModuleD }
    public class ChangeModule
    {
        public ModuleName SetModule { set; get; } 
    }
}