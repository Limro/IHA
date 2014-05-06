using System;

using OxyPlot;
using OxyPlot.Series;

namespace Calculator
{
    public class MainViewModel
    {
        public MainViewModel()
        {
            this.MyModel = new PlotModel("Example 1");
            this.MyModel.Series.Add(new FunctionSeries(Math.Cos, 0, 10, 0.1, "cos(x)"));
        }

        public PlotModel MyModel { get; private set; }
    }
}
