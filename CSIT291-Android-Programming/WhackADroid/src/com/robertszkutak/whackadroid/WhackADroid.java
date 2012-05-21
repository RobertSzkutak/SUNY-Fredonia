package com.robertszkutak.whackadroid;

import android.app.Activity;
import android.content.Context;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Vibrator;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class WhackADroid extends Activity 
{
	
    TextView score;
    ImageButton droids[] = new ImageButton[12];
    
    Handler mHandler = new Handler();
    MediaPlayer mp;
    Vibrator v;
    
    int scorevalue = 0;
    int healthvalue = 3;
    boolean active[] = new boolean[12];
    boolean notActive = false;
    
    @Override
    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        //Music
        mp = MediaPlayer.create(this, R.raw.background);
        mp.setLooping(true);
        mp.start();
        
        //Render playingfield
        score = (TextView) findViewById(R.id.textView1);
        score.setText(printScore());
        
        droids[0] = (ImageButton) findViewById(R.id.imageButton1);
        droids[1] = (ImageButton) findViewById(R.id.imageButton2);
        droids[2] = (ImageButton) findViewById(R.id.imageButton3);
        droids[3] = (ImageButton) findViewById(R.id.imageButton4);
        droids[4] = (ImageButton) findViewById(R.id.imageButton5);
        droids[5] = (ImageButton) findViewById(R.id.imageButton6);
        droids[6] = (ImageButton) findViewById(R.id.imageButton7);
        droids[7] = (ImageButton) findViewById(R.id.imageButton8);
        droids[8] = (ImageButton) findViewById(R.id.imageButton9);
        droids[9] = (ImageButton) findViewById(R.id.imageButton10);
        droids[10] = (ImageButton) findViewById(R.id.imageButton11);
        droids[11] = (ImageButton) findViewById(R.id.imageButton12);
        
        v = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);
        
        for(int i = 0; i < 12; i++)
        {
        	active[i] = false;
        	droids[i].setVisibility(4);//Make invisible
        	final int j = i;
        	droids[i].setOnClickListener(new View.OnClickListener() 
        	{
        		public void onClick(View v)
        		{
        			
        			if(active[j] == true)
        			{
        				droids[j].setVisibility(4);//Make invisible
        				scorevalue++;
        	        	score.setText(printScore());
        				active[j] = false;
        			}
        			
        		}
        	});
        }
        
        //The main game loop - this loop executes every 2 seconds
        new Thread(new Runnable() 
        {
            @Override
            public void run() 
            {
                while (true) 
                {
                    try 
                    {
                        Thread.sleep(2000);
                        mHandler.post(new Runnable() 
                        {

                            @Override
                            public void run() 
                            {
                            	if(notActive == false)
                            	{
                            		for(int i = 0; i < 12; i++)
                            		{
                            			if(active[i] == true)
                            			{
                            				droids[i].setVisibility(4);//Make invisible
                            				active[i] = false;
                            				v.vibrate(300);
                            				healthvalue--;
                            				score.setText(printScore());
                            				if(healthvalue == 0){
                            					notActive = true;
                            					finish();
                            				}
                            			}
                            		}
                              	 
                            		int rand = (int) (Math.random() * 12 + 0);
                              	 
                            		active[rand] = true;
                            		droids[rand].setVisibility(0);//Make Visible
                              	 
                            	}
                            }
                        });
                    } catch (Exception e) 
                      {
                      }
                }
            }
        }).start();
    }
    
    //Stop the game if interrupted
    @Override
    public void onPause()
    {
    	super.onPause();
    	
    	if(mp.isPlaying())
    		mp.pause();
    	
    	notActive = true;
    	
    }
    
    //Resume the game when interruption ends
    @Override
    public void onResume()
    {
    	super.onResume();
    	
    	if(!mp.isPlaying())
    		mp.start();
    	
    	notActive = false;
    }
    
    //Return a string showing the total health and score
    String printScore()
    {
    	String ret = "";
    	
    	ret = "Score: " + String.valueOf(scorevalue);
		for(int h = 0; h < 20; h++)
			ret += " ";
		ret += "Health: " + String.valueOf(healthvalue);
    	
    	return ret;
    }
}