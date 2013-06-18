package limrotoTech.sweight;

import java.util.List;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.TextView;

public class CustomListViewWeightAdapter extends ArrayAdapter<weightRowItem> {

    private static final String TAG = "CustomListViewWeightAdapter";
    Context context;

    public CustomListViewWeightAdapter(Context context, int resourceId,
                                       List<weightRowItem> items) {
        super(context, resourceId, items);
        this.context = context;
    }

    /*private view holder class*/
    private class ViewHolder {
        TextView date;
        TextView weight;
        TextView ID;
        Button rowEdit;
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder = null;
        weightRowItem rowItem = getItem(position);

        LayoutInflater mInflater = (LayoutInflater) context
                .getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
        if (convertView == null) {
            convertView = mInflater.inflate(R.layout.rowfile, null);
            holder = new ViewHolder();
            holder.date = (TextView) convertView.findViewById(R.id.rowTextDate);
            holder.weight = (TextView) convertView.findViewById(R.id.rowTextWeight);
            holder.rowEdit = (Button) convertView.findViewById(R.id.RowEdit);
            convertView.setTag(holder);
        } else
            holder = (ViewHolder) convertView.getTag();

        holder.date.setText(rowItem.GetDate() + " - ");
        holder.weight.setText(rowItem.GetWeight());

        holder.rowEdit.setOnClickListener(new EditBtnListener(position));

        return convertView;
    }

    private class EditBtnListener implements View.OnClickListener
    {
        int _pos;

        public EditBtnListener(int pos)
        {
            _pos = pos;
        }
        @Override
        public void onClick(View view) {
            Log.i(TAG, "Clicked on edit");
            Intent i = new Intent();
            i.setAction("EditClick");
            i.putExtra("ClickRow", _pos);
            context.sendBroadcast(i);
        }
    }
}