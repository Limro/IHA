namespace Infrastructure
{
    public interface IDllClass
    {
        bool Init();
        bool Run();
        void TearDown();
    }
}