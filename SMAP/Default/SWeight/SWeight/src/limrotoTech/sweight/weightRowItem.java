package limrotoTech.sweight;

public class weightRowItem {
    private String _date;
    private double _weight;
    private int _id;

    public weightRowItem(int id, String date, double weight)
    {
        _id = id;
        _date = date;
        _weight = weight;
    }

    public String GetDate()
    {
        return _date;
    }

    public String GetWeight()
    {
        return "" + _weight;
    }

    public int GetId()
    {
        return _id;
    }
}
