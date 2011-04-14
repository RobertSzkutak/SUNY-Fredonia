package com.robertszkutak.demo1xml;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class Demo1XML extends Activity {
	
	TextView display;
	EditText input;
	Button button;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        //This loads the objects defined XML so we can change them and use them dynamically in code
        //The ID of XML objects is defined in the android:id attribute in the XML itself
        display = (TextView) findViewById(R.id.text1);
        input = (EditText) findViewById(R.id.editText1);
        button = (Button) findViewById(R.id.button1);
        
        button.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			display.setText(input.getText().toString());
    			
    		}
    	});

    }
}