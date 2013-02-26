using System;
using System.Runtime.InteropServices;

namespace Beep_2
{
    class Program
    {
        private const string Lab1Path = @"\..\..\..\..\..\LAB1\Debug\LAB1.dll";
        
        [DllImport(Lab1Path, CallingConvention = CallingConvention.Cdecl)]
        public static extern double AddCharStrings(string arg1, string arg2);

        [DllImport(Lab1Path, CallingConvention = CallingConvention.Cdecl)]
        public static extern double AddDoubles(double arg1, double arg2);

        //[DllImport(Lab1Path)]
        //public static extern double AddStrings(string arg1, string arg2);

        static void Main(string[] args)
        {
            var value2 = AddDoubles(2, 3);
            var value1 = AddCharStrings("2", "3");

            

            //var value3 = AddStrings("2", "3");

            Console.WriteLine(value1);
            Console.WriteLine(value2);
            Console.ReadKey();
            //Console.WriteLine(value3);
        }
    }
}
