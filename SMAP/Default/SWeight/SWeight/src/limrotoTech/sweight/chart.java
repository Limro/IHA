package limrotoTech.sweight;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.os.Bundle;

import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Spinner;
import com.androidplot.Plot;
import com.androidplot.xy.SimpleXYSeries;
import com.androidplot.series.XYSeries;
import com.androidplot.xy.*;

import java.text.FieldPosition;
import java.text.Format;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

public class chart extends Activity
{
    private XYPlot mySimpleXYPlot;
    private Database db;
    private final String TAG = "chart";
    private Number[] dates;
    private Number[] weights;
    private XYSeries plotLine;

    private List<Entry> FetchData(String from, String to)
    {
        Log.i(TAG, "Fetching all entries");
        List<Entry> list = db.getEntriesInPeriod(to, from);

        return list;
    }

    private void ConvertDbData(List<Entry> list)
    {
        Log.i(TAG, "Converting data to arrays");
        Log.d(TAG, "List is " + list.size() + " big");
        List<Number> datesArray = new ArrayList<Number>();
        List<Number> weightsArray = new ArrayList<Number>();

        try
        {
            for(int i = 0 ; i < list.size() ; i++)
            {
                datesArray.add(TimeToEpochConverter(list.get(i).DateEntry));
                weightsArray.add(list.get(i).WeightEntry);
            }

            dates = new Number[datesArray.size()];
            datesArray.toArray(dates);

            weights = new Number[weightsArray.size()];
            weightsArray.toArray(weights);
        }
        catch (Exception e)
        {
            Log.d(TAG, "Something went wrong adding dates or weights");
            e.printStackTrace();
        }
    }

    public chart()
    {
        Log.i(TAG, "Accessing database");
        db = new Database(this);
    }

    private void UseTestData()
    {
        dates = new Number[]{
                TimeToEpochConverter("2013-04-30 07:30:20"),
                TimeToEpochConverter("2013-05-01 07:30:20"),
                TimeToEpochConverter("2013-05-02 07:30:20"),
                TimeToEpochConverter("2013-05-03 07:30:20"),
                TimeToEpochConverter("2013-05-04 07:30:20"),
                TimeToEpochConverter("2013-05-05 07:30:20"),
                TimeToEpochConverter("2013-05-06 07:30:20"),
                TimeToEpochConverter("2013-05-07 07:30:20"),
                TimeToEpochConverter("2013-05-08 07:30:20"),
                TimeToEpochConverter("2013-05-09 07:30:20"),
                TimeToEpochConverter("2013-05-10 07:30:20"),
                TimeToEpochConverter("2013-05-11 07:30:20"),
                TimeToEpochConverter("2013-05-12 07:30:20"),
                TimeToEpochConverter("2013-05-13 07:30:20"),
                TimeToEpochConverter("2013-05-14 07:30:20"),
                TimeToEpochConverter("2013-05-15 07:30:20")};
        weights = new Number[]{
                88,
                88.3,
                88.4,
                87.9,
                87.8,
                88.5,
                90.0,
                90.3,
                90.3,
                90.3,
                90.3,
                90.3,
                90.3,
                90.3,
                90.3,
                90.4};
    }

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.chart);

        //UseInsertedData();
        InitViews();
    }

    private void UseInsertedData() {
        Log.i(TAG, "Creating custom times");
        String time1 = "2013-05-23 07:11:00";
        String time2 = "2013-05-22 07:11:00";
        String time3 = "2013-05-21 07:11:00";
        String time4 = "2013-05-20 07:11:00";
        String time5 = "2013-05-19 07:11:00";
        String time6 = "2013-05-18 07:11:00";
        String time7 = "2013-05-12 07:11:00";
        String time8 = "2013-04-23 07:11:00";
        String time9 = "2013-03-23 07:11:00";
        String time10 = "2013-01-23 07:11:00";

        Log.i(TAG, "Creating custom entries");
        Entry e1 = new Entry(90.2, time1);
        Entry e2 = new Entry(91.2, time2);
        Entry e3 = new Entry(93.2, time3);
        Entry e4 = new Entry(91.2, time4);
        Entry e5 = new Entry(93.2, time5);
        Entry e6 = new Entry(91.2, time6);
        Entry e7 = new Entry(93.2, time7);
        Entry e8 = new Entry(91.2, time8);
        Entry e9 = new Entry(90.2, time9);
        Entry e10 = new Entry(92.2, time10);

        Log.i(TAG, "Inserting custom in database");
        db.insertEntry(e1);
        db.insertEntry(e2);
        db.insertEntry(e3);
        db.insertEntry(e4);
        db.insertEntry(e5);
        db.insertEntry(e6);
        db.insertEntry(e7);
        db.insertEntry(e8);
        db.insertEntry(e9);
        db.insertEntry(e10);
        Log.i(TAG, "All done");
    }

    private void InitViews() {
        Spinner s = (Spinner)findViewById(R.id.ChartSpinner);

        s.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l)
            {
                FetchAndHandleDataForTimePeriod(i + 1);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
    }

    private void FetchAndHandleDataForTimePeriod(int period)
    {
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        Log.i(TAG, "Selected " + period);

        switch (period)
        {
            case 1:
                //3 days
                c1.add(Calendar.HOUR, -(24*3));
                break;
            case 2:
                //7 days
                c1.add(Calendar.HOUR, -(24*7));
                break;
            case 3:
                //2 weeks
                c1.add(Calendar.HOUR, -(24*7*2));
                break;
            case 4:
                //1 month
                c1.add(Calendar.MONTH, -(1));
                break;
            case 5:
                //3 months
                c1.add(Calendar.MONTH, -(3));
                break;
            case 6:
                //6 months
                c1.add(Calendar.MONTH, -(6));
                break;
            case 7:
                //1 year
                c1.add(Calendar.YEAR, -(1));
                break;
            case 8:
                c1.set(2013, 1, 1, 0, 0, 0);
                break;
        }

        c1.set(Calendar.HOUR, 0); // yyyy/MM/dd 00:00:00
        c1.set(Calendar.MINUTE, 0);
        c1.set(Calendar.SECOND, 0);

        String pastTime = (String) android.text.format.DateFormat
                .format("yyyy-MM-dd hh:mm:ss",c1.getTime());

        String currentTime = (String) android.text.format.DateFormat
                .format("yyyy-MM-dd hh:mm:ss", c2.getTime());

        Log.i(TAG, "Extracting data");
        List<Entry> list = FetchData(pastTime, currentTime);

        Log.i(TAG, "Converting data");
        ConvertDbData(list);

        ShowPlot();
    }

    private void ShowPlot()
    {
        mySimpleXYPlot = (XYPlot) findViewById(R.id.chartPlot);
        mySimpleXYPlot.setTitle("Weight");

        if(plotLine != null)
            mySimpleXYPlot.removeSeries(plotLine);

        mySimpleXYPlot.getGraphWidget().getGridBackgroundPaint().setColor(Color.WHITE);
        mySimpleXYPlot.getGraphWidget().getGridLinePaint().setColor(Color.BLACK);
        mySimpleXYPlot.getGraphWidget().getGridLinePaint().setPathEffect(new DashPathEffect(new float[]{1, 1}, 1));
        mySimpleXYPlot.getGraphWidget().getDomainOriginLinePaint().setColor(Color.BLACK);
        mySimpleXYPlot.getGraphWidget().getRangeOriginLinePaint().setColor(Color.BLACK);

        mySimpleXYPlot.setBorderStyle(Plot.BorderStyle.SQUARE, null, null);
        mySimpleXYPlot.getBorderPaint().setStrokeWidth(1);
        mySimpleXYPlot.getBorderPaint().setAntiAlias(false);
        mySimpleXYPlot.getBorderPaint().setColor(Color.WHITE);
        mySimpleXYPlot.getGraphWidget().setPaddingRight(5);

        // Create a formatter to use for drawing a series using LineAndPointRenderer:
        LineAndPointFormatter series1Format = new LineAndPointFormatter(
                Color.rgb(0, 100, 0),                   // line color
                Color.rgb(0, 100, 0),                   // point color
                Color.rgb(100, 200, 0));                // fill color

        // setup our line fill paint to be a slightly transparent gradient:
        Paint lineFill = new Paint();
        lineFill.setAlpha(200);
        lineFill.setShader(new LinearGradient(0, 0, 0, 250, Color.WHITE, Color.GREEN, Shader.TileMode.MIRROR));

        LineAndPointFormatter formatter  = new LineAndPointFormatter(Color.rgb(0, 0,0), Color.BLUE, Color.RED);
        formatter.setFillPaint(lineFill);

        plotLine = new SimpleXYSeries(
                Arrays.asList(dates),
                Arrays.asList(weights),
                "Weight over time");
        mySimpleXYPlot.addSeries(plotLine, formatter);
        mySimpleXYPlot.redraw();

        // draw a domain tick for each year:
        int min = DomainMin();
        int max = DomainMax();
        int domainStep = domainStep(min, max);
        mySimpleXYPlot.setDomainStep(XYStepMode.SUBDIVIDE, domainStep);
        //mySimpleXYPlot.setDomainBoundaries(min, max, BoundaryMode.AUTO);

        // customize our domain/range labels
        mySimpleXYPlot.setDomainLabel("Date");
        mySimpleXYPlot.setRangeLabel("Weight");

        Double minimum = FindMinimum();
        Double maximum = FindMaximum();
        Double stepSize = FindStep(maximum, minimum);
        mySimpleXYPlot.setRangeBoundaries(minimum, maximum, BoundaryMode.FIXED);
        mySimpleXYPlot.setRangeStep(XYStepMode.INCREMENT_BY_VAL, stepSize);

        mySimpleXYPlot.setDomainValueFormat(new Format()
        {
            private SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM");

            @Override
            public StringBuffer format(Object obj, StringBuffer toAppendTo, FieldPosition pos) {

                // because our timestamps are in seconds and SimpleDateFormat expects milliseconds
                // we multiply our timestamp by 1000:
                long timestamp = ((Number) obj).longValue() * 1000;
                Date date = new Date(timestamp);
                return dateFormat.format(date, toAppendTo, pos);
            }

            @Override
            public Object parseObject(String source, ParsePosition pos) {
                return null;

            }
        });

        // by default, AndroidPlot displays developer guides to aid in laying out your plot.
        // To get rid of them call disableAllMarkup():
        mySimpleXYPlot.disableAllMarkup();


    }

    private int DomainMax() {
        double greatest = 0.0;
        for(Number d : dates)
        {
            if(d.doubleValue()  > greatest)
                greatest = d.doubleValue();
        }

        return (int)(greatest/86400);
    }

    private int DomainMin() {
        double smallest = Double.MAX_VALUE;
        for(Number d : dates)
        {
            if(d.doubleValue() < smallest)
                smallest = d.doubleValue();
        }
        return (int)(smallest/86400);
    }

    private int domainStep(int min, int max) {
        int diff = (max - min);
        return ( diff < 9 ? diff + 1 : 9);
    }

    private Double FindStep(double max, double min) {
        double diff = max - min;
        if(diff < 5)
            return 0.5;
        else if(diff > 5 && diff < 10)
            return 2.0;
        else if(diff > 10 && diff < 60)
            return 5.0;
        else
            return 10.0;
    }

    private Double FindMinimum() {
        Double smallest = 1000.0;
        for(Number d : weights)
        {
            if(d.doubleValue() < smallest.doubleValue())
                smallest = d.doubleValue();
        }
        Double bit = smallest%1;
        return smallest- bit;
    }

    private Double FindMaximum() {
        Double greatest = 0.0;
        for(Number d : weights)
        {
            if(d.doubleValue() > greatest)
                greatest = d.doubleValue();
        }
        Double bit = 1 - greatest%1;
        return greatest + bit;
    }

    private long TimeToEpochConverter(String time)
    {
        long epoch;

        Log.i(TAG, "Parsing " + time + " to epoch");
        try
        {
            epoch = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(time).getTime() / 1000;
        }
        catch (ParseException e)
        {
            Log.d(TAG, "Epoch convertion fail");
            e.printStackTrace();
            epoch = 0;
        }

        return epoch;
    }
}