package com.robertszkutak.demo1java;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

public class Demo1Java extends Activity {
	
	LinearLayout ll;
	TextView display;
	EditText input;
	Button button;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        ll = new LinearLayout(this);
        display = new TextView(this);
        input = new EditText(this);
        button = new Button(this);
        
        ll.setOrientation(LinearLayout.VERTICAL);
        display.setText("Enter Text To Display");
        input.setHint("Enter Text Here!!");
        button.setText("Click to Display Text!");
        
        ll.addView(display);
        ll.addView(input);
        ll.addView(button);
        
        setContentView(ll);
        
        button.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			display.setText(input.getText().toString());
    			
    		}
    	});
    }
}