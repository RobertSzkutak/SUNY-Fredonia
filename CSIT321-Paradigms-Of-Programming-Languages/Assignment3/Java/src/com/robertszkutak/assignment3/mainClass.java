package com.robertszkutak.assignment3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import com.robertszkutak.assignment3.Student;

public class mainClass {
	
	public static Student student;

	public static void main(String[] args) {
		student = new Student();
		student.initialize();
        while(true){
        	
        	System.out.println("Welcome to SUNY Fredonia CSIT Course Planner!");
        	System.out.println("1 -- Tell us a course you have taken.");
        	System.out.println("2 -- View what courses you can take.");
        	System.out.println("3 -- View prerequisites for a specific course.");
        	System.out.println("4 -- View postrequisites for a specific course.");
        	System.out.println("5 -- Clear all data about yourself");
        	
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

            String selection = null;

            try {
               selection = br.readLine();
            } catch (IOException ioe) {
               System.out.println("I/O Error!");
            }

            int selectionValue = 0;
            try {
            	selectionValue = Integer.parseInt(selection);
            } catch (Exception ioe) {
            	System.out.println("Error input an integer!");
            }
            
            if(selectionValue == 1){
            	System.out.println("Enter a CSIT Course Number: ");
            	BufferedReader br2 = new BufferedReader(new InputStreamReader(System.in));

                String selection2 = null;

                try {
                   selection2 = br2.readLine();
                } catch (IOException ioe) {
                   System.out.println("I/O Error!");
                }

                int selectionValue2 = 0;
                try {
                	selectionValue2 = Integer.parseInt(selection2);
                } catch (Exception ioe) {
                	System.out.println("Error input an integer!");
                }
                student.setTaken(selectionValue2);
            }
            
            if(selectionValue == 2)
            	System.out.println(student.whatCanBeTaken());
            
            if(selectionValue == 3){
            	System.out.println("Enter a CSIT Course Number: ");
            	BufferedReader br2 = new BufferedReader(new InputStreamReader(System.in));

                String selection2 = null;

                try {
                   selection2 = br2.readLine();
                } catch (IOException ioe) {
                   System.out.println("I/O Error!");
                }

                int selectionValue2 = 0;
                try {
                	selectionValue2 = Integer.parseInt(selection2);
                } catch (Exception ioe) {
                	System.out.println("Error input an integer!");
                }
                System.out.println(student.getPreReq(selectionValue2));
            }
            
            if(selectionValue == 4){
            	System.out.println("Enter a CSIT Course Number: ");
            	BufferedReader br2 = new BufferedReader(new InputStreamReader(System.in));

                String selection2 = null;

                try {
                   selection2 = br2.readLine();
                } catch (IOException ioe) {
                   System.out.println("I/O Error!");
                }

                int selectionValue2 = 0;
                try {
                	selectionValue2 = Integer.parseInt(selection2);
                } catch (Exception ioe) {
                	System.out.println("Error input an integer!");
                }
                System.out.println(student.getPostReq(selectionValue2));
            }
        	
            if(selectionValue == 5)
            	student.initialize();
            
        }
	}

}
