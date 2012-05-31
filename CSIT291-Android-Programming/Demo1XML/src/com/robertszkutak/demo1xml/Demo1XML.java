/*
Demo1XML.java : A demonstration application for Android for my students
Copyright (C) 2011 : Robert L Szkutak II

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

*/

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