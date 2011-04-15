/*
OhmsLawCalculator.java : A part of the OhmsLawCalculator application for Android
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

package com.robertszkutak.ohmslawcalculatorsplash;

import android.app.Activity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;

public class OhmsLawCalculator extends Activity {
    
	LinearLayout ll, ll2;
	TextView  text1, textbefore2, text2, text3, text4, text5, text6, text7;
	ScrollView sv;
	EditText volt, amp, res;
	RadioGroup rg;
	RadioButton rb1, rb2;
	Button addresistor, calculate, clear;
	private int resistors = 0, pors = 0;
	private double voltage = -1, current = -1, resistance = -1;
	TextView resistortext[] = new TextView[100];
    EditText resistoredittext[] = new EditText[100];
    double resistorvalues[] = new double[100];//Im basically limiting to no more than 100 resistors :/
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        for(int i = 0; i < 100; i++){
        	resistorvalues[i] = -1;
        }
        
        setupMenu();
        
    }
    
    public void setupMenu(){
    	
    	ll = new LinearLayout(this);
    	ll.setOrientation(LinearLayout.VERTICAL);
    	ll.setBackgroundColor(0xFFFFFFFF);
    	
    	text1 = new TextView(this);
    	text1.setTextColor(0xFF000000);
        text1.setGravity(Gravity.CENTER);
        text1.setText("Ohm's Law Calculator\n");
        text1.setTextSize(20f);
        
        calculate = new Button(this);
    	calculate.setText("Calculate");
    	
    	textbefore2 = new TextView(this);
    	textbefore2.setTextColor(0xFF000000);
    	textbefore2.setText("");
        textbefore2.setTextSize(20f);
    	
    	sv = new ScrollView(this);
    	sv.setVerticalScrollBarEnabled(true);
    	
    	ll2 = new LinearLayout(this);
    	ll2.setOrientation(LinearLayout.VERTICAL);
    	
        rb1 = new RadioButton(this);
        rb1.setTextColor(0xFF000000);
        rb1.setText("Series Circuit");
        rb1.setId(0);
        
        rb2 = new RadioButton(this);
        rb2.setText("Parallel Circuit");
        rb2.setTextColor(0xFF000000);
        rb2.setId(1);
        
        rg = new RadioGroup(this);
        rg.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams layoutParams = new RadioGroup.LayoutParams(
                RadioGroup.LayoutParams.WRAP_CONTENT,
                RadioGroup.LayoutParams.WRAP_CONTENT);
        rg.addView(rb1, 0, layoutParams);
        rg.addView(rb2, 1, layoutParams);
        if(pors == 0)
        	rg.check(0);
        if(pors == 1)
        	rg.check(1);
    	
    	text2 = new TextView(this);
    	text2.setTextColor(0xFF000000);
        text2.setGravity(Gravity.LEFT);
        text2.setText("Voltage (Volts)");
        text2.setTextSize(20f);
        
        volt = new EditText(this);
        if(voltage != -1.0)
        	volt.setText(Double.toString(voltage));
        else
        	volt.setHint("Unknown");
        volt.setInputType(2);
        
        text3 = new TextView(this);
    	text3.setTextColor(0xFF000000);
        text3.setGravity(Gravity.LEFT);
        text3.setText("\nCurrent (Amperage)");
        text3.setTextSize(20f);
        
        amp = new EditText(this);
        if(current != -1.0)
        	amp.setText(Double.toString(current));
        else
        	amp.setHint("Unknown");
        amp.setInputType(2);
        
        text4 = new TextView(this);
    	text4.setTextColor(0xFF000000);
        text4.setGravity(Gravity.LEFT);
        text4.setText("\nResistance (Ohms)");
        text4.setTextSize(20f);
        
        res = new EditText(this);
        if(resistance != -1.0)
        	res.setText(Double.toString(resistance));
        else
        	res.setHint("Unknown");
        res.setInputType(2);
        
        text5 = new TextView(this);
        if(resistors == 0){
        	text5.setTextColor(0x00000000);
        	text5.setText("");
        }
        if(resistors > 0){
        	text5.setTextColor(0xFF000000);
        	text5.setText("\nSelect Resistor Wiring:");
        }
        text5.setTextSize(20f);
        
        if(resistors > 0){
        	for(int i = 0; i < resistors; i++){
        		String resistorstring = "\nResistor " + Integer.toString(i+1);
        		resistortext[i] = new TextView(this);
        		resistortext[i].setText(resistorstring);
        		resistortext[i].setTextColor(0xFF000000);
        		resistortext[i].setGravity(Gravity.LEFT);
        		resistortext[i].setTextSize(20f);
        		resistoredittext[i] = new EditText(this);
        		if(resistorvalues[i] != -1.0)
        			resistoredittext[i].setText(Double.toString(resistorvalues[i]));
        		else
        			resistoredittext[i].setHint("Unknown");
        		resistoredittext[i].setInputType(2);
        	}
        }
        
        text6 = new TextView(this);
    	text6.setTextColor(0x00000000);
    	text6.setText("");
        
        addresistor = new Button(this);
    	addresistor.setText("Add a Resistor");
    	
    	text7 = new TextView(this);
    	text7.setTextColor(0x00000000);
    	text7.setText("");
    	
    	clear = new Button(this);
    	clear.setText("Reset Calculator");
        
        ll.addView(text1);
        ll.addView(calculate);
        ll.addView(textbefore2);
        ll.addView(sv);
        sv.addView(ll2);
        ll2.addView(text2);
        ll2.addView(volt);
        ll2.addView(text3);
        ll2.addView(amp);
        ll2.addView(text4);
        ll2.addView(res);
        ll2.addView(text5);
        if(resistors > 0){
        	ll2.addView(rg);
        	for(int i = 0; i < resistors; i++){
        		ll2.addView(resistortext[i]);
        		ll2.addView(resistoredittext[i]);
        	}
        }
        if(resistors > 0)
        	ll2.addView(text6);
        ll2.addView(addresistor);
        ll2.addView(text7);
        ll2.addView(clear);
        
        setContentView(ll);
        
        addresistor.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			if(saneString(volt.getText().toString()) == true)
    				voltage = Double.parseDouble(volt.getText().toString());
    			if(saneString(amp.getText().toString()) == true)
    				current = Double.parseDouble(amp.getText().toString());
    			if(saneString(res.getText().toString()) == true)
    				resistance = Double.parseDouble(res.getText().toString());
    			
    			if(resistors > 0){
    				for(int i = 0; i < resistors; i++){
    					if(saneString(resistoredittext[i].getText().toString()) == true)
    						resistorvalues[i] = Double.parseDouble(resistoredittext[i].getText().toString());
    				}
    				
    				pors = rg.getCheckedRadioButtonId();
    				
    			}
    			
    			resistors += 1;
    			
    			setupMenu();
    			
    		}
    	});
        
        calculate.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			if(saneString(volt.getText().toString()) == true)
    				voltage = Double.parseDouble(volt.getText().toString());
    			if(saneString(amp.getText().toString()) == true)
    				current = Double.parseDouble(amp.getText().toString());
    			if(saneString(res.getText().toString()) == true)
    				resistance = Double.parseDouble(res.getText().toString());
    			
    			if(resistors > 0){
    				for(int i = 0; i < resistors; i++){
    					if(saneString(resistoredittext[i].getText().toString()) == true)
    						resistorvalues[i] = Double.parseDouble(resistoredittext[i].getText().toString());
    				}
    				
    				pors = rg.getCheckedRadioButtonId();
    				
    			}
    			
    			calculatecircuit();
    			
    			setupMenu();
    			
    		}
    	});
        
        clear.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			resistors = pors = 0;
    			voltage = current = resistance = -1;
    			for(int i = 0; i < 100; i++){
    	        	resistorvalues[i] = -1;
    	        }
    			setupMenu();
    			
    		}
    	});
        
    }
    
    public void calculatecircuit(){
    	/* 0 = No State
    	 * 1 = Calculate Voltage
    	 * 2 = Calculate Current
    	 * 3 = Calculate Resistance
    	 * 4 = Calculate Total Resistance From Resistors Then Reevaluate Calculation
    	 * 5 = Calculate Value Of Missing Resistor Then Reevaluate Calculation
    	 */
    	
    	int state = 0;
    	
    	if((voltage == -1 && current == -1 && resistors == 0) || (voltage == -1 && resistance == -1 && resistors == 0) || 
    			(current == -1 && resistance == -1 && resistors == 0))
    		return;
    	
    	if(resistance == -1 && resistors > 0){
    		for(int i = 0; i < resistors; i++){
    			if(resistorvalues[i] == -1 && (current == -1 || voltage == -1))
    				return;//We can't have a missing resistor with no way to calculate resistance
    		}
    	}
    	
    	if(voltage == -1)
    		state = 1;
    	
    	if(current == -1)
    		state = 2;
    	
    	if(resistance == -1)
    		state = 4;
    	
    	if(resistance == -1 && resistors == 0)
    		state = 3;
    	
    	if(resistance == -1 && resistors > 0){
    		for(int i = 0; i < resistors; i++){
    			if(resistorvalues[i] == -1)
    				return;//Make sure we dont have missing resistors and missing resistance
    		}
    	}
    	
    	if(resistance != -1 && resistors > 0){
    		for(int i = 0; i < resistors; i++){
    			if(resistorvalues[i] == -1)
    				state = 5;
    		}
    	}
    	
    	if(state == 0)
    		return;
    	
    	if(state == 1){
    		voltage = current / resistance;
    		return;
    	}
    	
    	if(state == 2){
    		if(voltage != -1)
    			current = voltage * resistance;
    		return;
    	}
    	
    	if(state == 3){
    		resistance = current / voltage;
    		return;
    	}
    	
    	if(state == 4){
    		resistance = 0;
    		//Series
    		if(pors == 0){
    			for(int i = 0; i < resistors; i++){
    				resistance += resistorvalues[i];
    			}
    		}
    		//Parallel
    		if(pors == 1){
    			double resistanceright = 0;
    			for(int i = 0; i < resistors; i++){
    				resistanceright += 1/resistorvalues[i];
    			}
    			resistance = 1/resistanceright;
    		}
    		calculatecircuit();
    		return;
    	}
    	
    	if(state == 5){
    		//Find the missing resistor
    		int missing = 0;
    		for(int i = 0; i < resistors; i++){
    			if(resistorvalues[i] == -1){
    				missing = i;
    				break;
    			}
    		}
    		//Find missing resistor in series
    		if(pors == 0){
    			resistorvalues[missing] = resistance;
    			for(int i = 0; i < resistors; i++){
    				if(i != missing)
    					resistorvalues[missing] -= resistorvalues[i];
    			}
    		}
    		//Find missing resistor in parallel
    		if(pors == 1){
    			resistorvalues[missing] = 1 / resistance;
    			for(int i = 0; i < resistors; i++){
    				if(i != missing)
    					resistorvalues[missing] -= 1 / resistorvalues[i];
    			}
    			if(resistorvalues[missing] != 0)
    				resistorvalues[missing] = 1 / resistorvalues[missing];
    		}
    		
    		calculatecircuit();//Because this could happen with amps or volts still missing
    	}
    	
    	return;
    }
    
    public boolean saneString ( String sanity ) { 
    	
    	if(sanity.length() <= 0)
    		return false;

    	for (int i=0; i < sanity.length(); i++) {
    		
    		if(sanity.charAt(i) != '0' &&		
    		   sanity.charAt(i) != '1' &&	
    		   sanity.charAt(i) != '2' &&	
    		   sanity.charAt(i) != '3' &&	
    		   sanity.charAt(i) != '4' &&	
    		   sanity.charAt(i) != '5' &&	
    		   sanity.charAt(i) != '6' &&		
    		   sanity.charAt(i) != '7' &&	
    		   sanity.charAt(i) != '8' &&	
    		   sanity.charAt(i) != '9' &&	
    		   sanity.charAt(i) != '.' &&
    		   sanity.charAt(i) != '-'   )

    			return false;

    	}

    	return true;

    }
}