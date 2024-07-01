namespace FooBar_core_01;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
        int counter = 0;
        while (true)
        {
            Console.WriteLine(string.Format("Pulse: {0}", ++counter));
            Thread.Sleep(2000);
        }
    }
}
