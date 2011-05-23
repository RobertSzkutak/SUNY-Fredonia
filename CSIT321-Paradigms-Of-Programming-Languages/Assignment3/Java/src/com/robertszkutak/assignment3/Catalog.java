package com.robertszkutak.assignment3;

import com.robertszkutak.assignment3.Course;

public class Catalog {
	
	private Course courses[] = new Course[66];
	
	public void initialize(){
		for(int i = 0; i < 66; i++){
			courses[i] = new Course();
			courses[i].setTaken(false);
		}
		courses[0].setNumber(100);
		courses[1].setNumber(101);
		courses[2].setNumber(104);
		courses[3].setNumber(105);
		courses[4].setNumber(107);
		courses[5].setNumber(120);
		courses[6].setNumber(121);
		courses[7].setNumber(151);
		courses[8].setNumber(201);
		courses[9].setNumber(203);
		courses[10].setNumber(205);
		courses[11].setNumber(207);
		courses[12].setNumber(221);
		courses[13].setNumber(224);
		courses[14].setNumber(225);
		courses[15].setNumber(231);
		courses[16].setNumber(241);
		courses[17].setNumber(242);
		courses[18].setNumber(251);
		courses[19].setNumber(300);
		courses[20].setNumber(305);
		courses[21].setNumber(311);
		courses[22].setNumber(312);
		courses[23].setNumber(321);
		courses[24].setNumber(335);
		courses[25].setNumber(341);
		courses[26].setNumber(351);
		courses[27].setNumber(390);
		courses[28].setNumber(400);
		courses[29].setNumber(411);
		courses[30].setNumber(413);
		courses[31].setNumber(425);
		courses[32].setNumber(431);
		courses[33].setNumber(433);
		courses[34].setNumber(435);
		courses[35].setNumber(436);
		courses[36].setNumber(437);
		courses[37].setNumber(441);
		courses[38].setNumber(443);
		courses[39].setNumber(451);
		courses[40].setNumber(456);
		courses[41].setNumber(461);
		courses[42].setNumber(462);
		courses[43].setNumber(463);
		courses[44].setNumber(471);
		courses[45].setNumber(473);
		courses[46].setNumber(475);
		courses[47].setNumber(490);
		courses[48].setNumber(496);
		courses[49].setNumber(497);
		courses[50].setNumber(499);
		courses[51].setNumber(536);
		courses[52].setNumber(537);
		courses[53].setNumber(541);
		courses[54].setNumber(542);
		courses[55].setNumber(580);
		courses[56].setNumber(591);
		courses[57].setNumber(613);
		courses[58].setNumber(625);
		courses[59].setNumber(636);
		courses[60].setNumber(639);
		courses[61].setNumber(649);
		courses[62].setNumber(665);
		courses[63].setNumber(669);
		courses[64].setNumber(670);
		courses[65].setNumber(672);
	}
	
	public boolean canBeTaken(int courseNumber){
		
		int index = this.findCourse(courseNumber);
		
		if(index == -1)
			return false;
		
		//You can't take a course you've already passed
		if(courses[index].getTaken() == true)
			return false;
		
		int preq[] = new int[21];
		
		if(courseNumber == 251)
			preq[0] = this.findCourse(104);
		if(courseNumber == 205 || courseNumber == 207 || courseNumber == 241 ||
		   courseNumber == 312)
			preq[1] = this.findCourse(105);
		if(courseNumber == 207)
			preq[2] = this.findCourse(107);
		if(courseNumber == 205 || courseNumber == 207 || courseNumber == 221 ||
		   courseNumber == 241 || courseNumber == 311 || courseNumber == 312)
			preq[3] = this.findCourse(121);
		if(courseNumber == 251)
			preq[4] = this.findCourse(151);
		if(courseNumber == 335 || courseNumber == 341 || courseNumber == 351 ||
		   courseNumber == 425 || courseNumber == 455 || courseNumber == 461 ||
		   courseNumber == 462 || courseNumber == 463 || courseNumber == 471 ||
		   courseNumber == 473 || courseNumber == 475)
			preq[5] = this.findCourse(205);
		if(courseNumber == 475)
			preq[6] = this.findCourse(207);
		if(courseNumber == 224 || courseNumber == 225 || courseNumber == 231 ||
		   courseNumber == 242 || courseNumber == 335 || courseNumber == 341 ||
		   courseNumber == 411 || courseNumber == 425 || courseNumber == 455 ||
		   courseNumber == 461 || courseNumber == 462 || courseNumber == 463 ||
		   courseNumber == 471 || courseNumber == 473 || courseNumber == 475)
			preq[7] = this.findCourse(221);
		if(courseNumber == 321)
			preq[8] = this.findCourse(224);
		if(courseNumber == 431)
			preq[9] = this.findCourse(231);
		if(courseNumber == 242)
			preq[10] = this.findCourse(241);
		if(courseNumber == 441 || courseNumber == 443)
			preq[11] = this.findCourse(242);
		if(courseNumber == 351)
			preq[12] = this.findCourse(251);
		if(courseNumber == 413 || courseNumber == 431 || courseNumber == 433 ||
		   courseNumber == 435)
			preq[13] = this.findCourse(311);
		if(courseNumber == 413 || courseNumber == 431 || courseNumber == 435 ||
		   courseNumber == 433)
			preq[14] = this.findCourse(312);
		if(courseNumber == 435)
			preq[15] = this.findCourse(335);
		if(courseNumber == 390 || courseNumber == 431 || courseNumber == 433 ||
		   courseNumber == 441 || courseNumber == 443 || courseNumber == 451 ||
		   courseNumber == 456 || courseNumber == 490 || courseNumber == 496 ||
		   courseNumber == 497 || courseNumber == 499 || courseNumber == 670)
			preq[16] = this.findCourse(341);
		if(courseNumber == 456 || courseNumber == 496 || courseNumber == 497 ||
		   courseNumber == 499)
			preq[17] = this.findCourse(351);
		if(courseNumber == 437)
			preq[18] = this.findCourse(431);
		if(courseNumber == 436)
			preq[19] = this.findCourse(435);
		if(courseNumber == 625)
			preq[20] = this.findCourse(425);
		
		if(courseNumber <= 203)
			return true;
		if(courseNumber == 205 && (courses[preq[1]].getTaken() == true || courses[preq[3]].getTaken() == true))
			return true;
		if(courseNumber == 207 && courses[preq[2]].getTaken() == true && (courses[preq[1]].getTaken() == true || courses[preq[3]].getTaken() == true))
			return true;
		if(courseNumber == 221 && courses[preq[3]].getTaken() == true)
			return true;
		if(courseNumber == 224 && courses[preq[3]].getTaken() == true)
			return true;
		if(courseNumber == 225 && courses[preq[3]].getTaken() == true)
			return true;
		if(courseNumber == 231 && courses[preq[3]].getTaken() == true)
			return true;
		if(courseNumber == 241 && (courses[preq[1]].getTaken() == true || courses[preq[3]].getTaken() == true))
			return true;
		if(courseNumber == 242 && courses[preq[7]].getTaken() == true && courses[preq[10]].getTaken() == true)
			return true;
		if(courseNumber == 251 && (courses[preq[4]].getTaken() == true || courses[preq[0]].getTaken() == true))
			return true;
		if(courseNumber == 311 && courses[preq[3]].getTaken() == true)
			return true;
		if(courseNumber == 312 && (courses[preq[1]].getTaken() == true || courses[preq[3]].getTaken() == true))
			return true;
		if(courseNumber == 321 && courses[preq[8]].getTaken() == true)
			return true;
		if(courseNumber == 335 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 341 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 351 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 390 && courses[preq[17]].getTaken() == true)
			return true;
		if(courseNumber == 411 && courses[preq[7]].getTaken() == true)
			return true;
		if(courseNumber == 413 && (courses[preq[13]].getTaken() == true || courses[preq[14]].getTaken() == true))
			return true;
		if(courseNumber == 425 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 431 && (courses[preq[13]].getTaken() == true || courses[preq[14]].getTaken() == true) && (courses[preq[16]].getTaken() == true || courses[preq[9]].getTaken() == true))
			return true;
		if(courseNumber == 433 && (courses[preq[13]].getTaken() == true || courses[preq[14]].getTaken() == true) && courses[preq[16]].getTaken() == true)
			return true;
		if(courseNumber == 435 && (courses[preq[13]].getTaken() == true || courses[preq[14]].getTaken() == true || courses[preq[15]].getTaken() == true))
			return true;
		if(courseNumber == 436 && courses[preq[19]].getTaken() == true)
			return true;
		if(courseNumber == 437 && courses[preq[18]].getTaken() == true)
			return true;
		if(courseNumber == 441 && courses[preq[11]].getTaken() == true && courses[preq[16]].getTaken() == true)
			return true;
		if(courseNumber == 443 && courses[preq[11]].getTaken() == true && courses[preq[16]].getTaken() == true)
			return true;
		if(courseNumber == 451 && courses[preq[16]].getTaken() == true)
			return true;
		if(courseNumber == 456 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 461 && (courses[preq[16]].getTaken() == true || courses[preq[17]].getTaken() == true))
			return true;
		if(courseNumber == 462 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 463 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 473 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true))
			return true;
		if(courseNumber == 475 && (courses[preq[5]].getTaken() == true || courses[preq[7]].getTaken() == true) && courses[preq[6]].getTaken() == true)
			return true;
		if(courseNumber == 490 && courses[preq[16]].getTaken() == true)
			return true;
		if(courseNumber == 496 && (courses[preq[16]].getTaken() == true || courses[preq[17]].getTaken() == true))
			return true;
		if(courseNumber == 497 && (courses[preq[16]].getTaken() == true || courses[preq[17]].getTaken() == true))
			return true;
		if(courseNumber == 499 && (courses[preq[16]].getTaken() == true || courses[preq[17]].getTaken() == true))
			return true;
		if(courseNumber == 625 && courses[preq[20]].getTaken() == true)
			return true;
		if(courseNumber == 670 && courses[preq[16]].getTaken() == true)
			return true;
		if(courseNumber > 499 && courseNumber != 670)
			return true;
		
		return false;
		
	}
	
	/*Returns the index of the array which holds that course number*/
	public int findCourse(int courseNumber){
		int ret = -1;
		
		for(int i = 0; i < 66; i++){
			if(courses[i].getNumber() == courseNumber) {
				ret = i;
				return ret;
			}
		}
		
		return ret;
		
	}
	
	public void setTaken(int courseNumber){
		int index = -1;
		index = findCourse(courseNumber);
		
		if(index > 0)
			courses[index].setTaken(true);
		
		return;
	}

}
