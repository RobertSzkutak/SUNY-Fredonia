package com.robertszkutak.whackadroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.text.util.Linkify;
import android.view.Gravity;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class SplashScreen extends Activity {
	
	LinearLayout ll;
	TextView title, body, link;
	ImageView graphic;
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
    	super.onCreate(savedInstanceState);
    	
    	//Render splashscreen
    	
    	ll = new LinearLayout(this);
    	ll.setOrientation(LinearLayout.VERTICAL);
    	ll.setBackgroundColor(0xFFFFFFFF);
    	
    	title = new TextView(this);
    	title.setText("WhackADroid\n");
    	title.setTextColor(0xFF000000);
    	title.setTextSize(18);
    	title.setGravity(Gravity.CENTER);
    	
    	graphic = new ImageView(this);
    	graphic.setBackgroundResource(R.drawable.graphic);
    	
    	body = new TextView(this);
    	body.setText("Robert Szkutak\nDerrik Decker\nCSIT 291 Android Programming\nSpring 01\nMay 9th, 2011\n\n\n");
    	body.setTextColor(0xFF000000);
    	body.setTextSize(16);
    	body.setGravity(Gravity.CENTER);
    	
    	link = new TextView(this);
        link.setTextSize(14f);
        link.setGravity(Gravity.CENTER);
        link.setAutoLinkMask(Linkify.WEB_URLS);
        link.setLinkTextColor(0xFF00FF00);
        link.setMovementMethod(LinkMovementMethod.getInstance());
        link.setText("http://robertszkutak.com");
        
        ll.addView(title);
        ll.addView(graphic);
        ll.addView(body);
        ll.addView(link);
        
        setContentView(ll);
        
        final Intent menuIntent = new Intent(this, Menu.class);
        
        ll.postDelayed(new Runnable() { 
            public void run() { 
           	 
           	 startActivity(menuIntent);
           	 finish();
           	 
            } 
       }, 25000); //Hold for 25 seconds
	}
}
