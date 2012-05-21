package com.robertszkutak.whackadroid;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

public class Menu extends Activity {
	
	LinearLayout ll;
	TextView title, filler;
	Button bt1, bt2;
	
	MediaPlayer mp;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	super.onCreate(savedInstanceState);
    	
    	//Setup music
    	mp = MediaPlayer.create(this, R.raw.menu);
    	mp.setLooping(true);
    	
    	//Render menu
    	ll = new LinearLayout(this);
    	ll.setOrientation(LinearLayout.VERTICAL);
    	ll.setBackgroundResource(R.drawable.background);
    	
    	title = new TextView(this);
    	title.setText("WhackADroid\n");
    	title.setGravity(Gravity.CENTER);
    	title.setTextSize(18);
    	title.setTextColor(0xFFFFFFFF);
    	
    	bt1 = new Button(this);
    	bt1.setText("Start");
    	
    	filler = new TextView(this);
    	
    	bt2 = new Button(this);
    	bt2.setText("Quit");
    	
    	ll.addView(title);
    	ll.addView(bt1);
    	ll.addView(filler);
    	ll.addView(bt2);
    	
    	setContentView(ll);
    	
    	final Intent game = new Intent(this, WhackADroid.class);
    	
    	//Start game
    	bt1.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			startActivity(game);
    			
    		}
    	});
    	
    	//Quit game
    	bt2.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View v){
    			
    			finish();
    			
    		}
    	});
    }
    
    //Stop music if interrupted
    @Override
    public void onPause(){
    	super.onPause();
    	
    	if(mp.isPlaying())
    		mp.pause();
    }
    
    //Resume music after being interrupted
    @Override
    public void onResume(){
    	super.onResume();
    	
    	if(!mp.isPlaying())
    		mp.start();
    }

}
