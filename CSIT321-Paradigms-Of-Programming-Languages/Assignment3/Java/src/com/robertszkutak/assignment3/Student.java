package com.robertszkutak.assignment3;

import com.robertszkutak.assignment3.Catalog;

public class Student {
	
	private Catalog courseCatalog;
	public void initialize(){
		courseCatalog = new Catalog();
		courseCatalog.initialize();
	}
	public void setTaken(int courseNumber){
		courseCatalog.setTaken(courseNumber);
	}
	public String whatCanBeTaken(){
		String ret = "";
		
		if(courseCatalog.canBeTaken(100) == true)
			ret += "CSIT 100 ";
		if(courseCatalog.canBeTaken(101)== true)
			ret += "CSIT 101 ";
		if(courseCatalog.canBeTaken(104)== true)
			ret += "CSIT 104 ";
		if(courseCatalog.canBeTaken(105)== true)
			ret += "CSIT 105 ";
		if(courseCatalog.canBeTaken(107)== true)
			ret += "CSIT 107 ";
		if(courseCatalog.canBeTaken(120)== true)
			ret += "CSIT 120 ";
		if(courseCatalog.canBeTaken(121)== true)
			ret += "CSIT 121 ";
		if(courseCatalog.canBeTaken(151)== true)
			ret += "CSIT 151 ";
		if(courseCatalog.canBeTaken(201)== true)
			ret += "CSIT 201 ";
		if(courseCatalog.canBeTaken(203)== true)
			ret += "CSIT 203 ";
		if(courseCatalog.canBeTaken(205)== true)
			ret += "CSIT 205 ";
		if(courseCatalog.canBeTaken(207)== true)
			ret += "CSIT 207 ";
		if(courseCatalog.canBeTaken(221)== true)
			ret += "CSIT 221 ";
		if(courseCatalog.canBeTaken(224)== true)
			ret += "CSIT 224 ";
		if(courseCatalog.canBeTaken(225)== true)
			ret += "CSIT 225 ";
		if(courseCatalog.canBeTaken(231)== true)
			ret += "CSIT 231 ";
		if(courseCatalog.canBeTaken(241)== true)
			ret += "CSIT 241 ";
		if(courseCatalog.canBeTaken(242)== true)
			ret += "CSIT 242 ";
		if(courseCatalog.canBeTaken(251)== true)
			ret += "CSIT 251 ";
		if(courseCatalog.canBeTaken(300)== true)
			ret += "CSIT 300 ";
		if(courseCatalog.canBeTaken(305)== true)
			ret += "CSIT 305 ";
		if(courseCatalog.canBeTaken(311)== true)
			ret += "CSIT 311 ";
		if(courseCatalog.canBeTaken(312)== true)
			ret += "CSIT 312 ";
		if(courseCatalog.canBeTaken(321)== true)
			ret += "CSIT 321 ";
		if(courseCatalog.canBeTaken(335)== true)
			ret += "CSIT 335 ";
		if(courseCatalog.canBeTaken(341)== true)
			ret += "CSIT 341 ";
		if(courseCatalog.canBeTaken(351)== true)
			ret += "CSIT 351 ";
		if(courseCatalog.canBeTaken(390)== true)
			ret += "CSIT 390 ";
		if(courseCatalog.canBeTaken(400)== true)
			ret += "CSIT 400 ";
		if(courseCatalog.canBeTaken(411)== true)
			ret += "CSIT 411 ";
		if(courseCatalog.canBeTaken(413)== true)
			ret += "CSIT 413 ";
		if(courseCatalog.canBeTaken(425)== true)
			ret += "CSIT 425 ";
		if(courseCatalog.canBeTaken(431)== true)
			ret += "CSIT 431 ";
		if(courseCatalog.canBeTaken(433)== true)
			ret += "CSIT 433 ";
		if(courseCatalog.canBeTaken(435)== true)
			ret += "CSIT 435 ";
		if(courseCatalog.canBeTaken(436)== true)
			ret += "CSIT 436 ";
		if(courseCatalog.canBeTaken(437)== true)
			ret += "CSIT 437 ";
		if(courseCatalog.canBeTaken(441)== true)
			ret += "CSIT 441 ";
		if(courseCatalog.canBeTaken(443)== true)
			ret += "CSIT 443 ";
		if(courseCatalog.canBeTaken(451)== true)
			ret += "CSIT 451 ";
		if(courseCatalog.canBeTaken(456)== true)
			ret += "CSIT 456 ";
		if(courseCatalog.canBeTaken(461)== true)
			ret += "CSIT 461 ";
		if(courseCatalog.canBeTaken(462)== true)
			ret += "CSIT 462 ";
		if(courseCatalog.canBeTaken(463)== true)
			ret += "CSIT 463 ";
		if(courseCatalog.canBeTaken(471)== true)
			ret += "CSIT 471 ";
		if(courseCatalog.canBeTaken(473)== true)
			ret += "CSIT 473 ";
		if(courseCatalog.canBeTaken(475)== true)
			ret += "CSIT 475 ";
		if(courseCatalog.canBeTaken(490)== true)
			ret += "CSIT 490 ";
		if(courseCatalog.canBeTaken(496)== true)
			ret += "CSIT 496 ";
		if(courseCatalog.canBeTaken(497)== true)
			ret += "CSIT 497 ";
		if(courseCatalog.canBeTaken(499)== true)
			ret += "CSIT 499 ";
		if(courseCatalog.canBeTaken(536)== true)
			ret += "CSIT 536 ";
		if(courseCatalog.canBeTaken(537)== true)
			ret += "CSIT 537 ";
		if(courseCatalog.canBeTaken(541)== true)
			ret += "CSIT 541 ";
		if(courseCatalog.canBeTaken(542)== true)
			ret += "CSIT 542 ";
		if(courseCatalog.canBeTaken(580)== true)
			ret += "CSIT 580 ";
		if(courseCatalog.canBeTaken(591)== true)
			ret += "CSIT 591 ";
		if(courseCatalog.canBeTaken(613)== true)
			ret += "CSIT 613 ";
		if(courseCatalog.canBeTaken(625)== true)
			ret += "CSIT 625 ";
		if(courseCatalog.canBeTaken(636)== true)
			ret += "CSIT 636 ";
		if(courseCatalog.canBeTaken(639)== true)
			ret += "CSIT 639 ";
		if(courseCatalog.canBeTaken(649)== true)
			ret += "CSIT 649 ";
	    if(courseCatalog.canBeTaken(665)== true)
	    	ret += "CSIT 665 ";
		if(courseCatalog.canBeTaken(669)== true)
			ret += "CSIT 669 ";
		if(courseCatalog.canBeTaken(670)== true)
			ret += "CSIT 670 ";
		if(courseCatalog.canBeTaken(672)== true)
			ret += "CSIT 672 ";
	
		return ret;
	}
	public String getPostReq(int courseNumber){
		String ret = "None";
		
		if(courseNumber == 104)
			ret = "CSIT 251";
		if(courseNumber == 105)
			ret = "CSIT 205, CSIT 207, CSIT 241 and CSIT 312";
		if(courseNumber == 107)
			ret = "CSIT 207";
		if(courseNumber == 121)
			ret = "CSIT 205, CSIT 221, CSIT 241, CSIT 311 and CSIT 312";
		if(courseNumber == 151)
			ret = "CSIT 251";
		if(courseNumber == 205)
			ret = "CSIT 335, CSIT 341, CSIT 351 and CSIT 425";
		if(courseNumber == 221)
			ret = "CSIT 224, CSIT 225, CSIT 231, CSIT 242, CSIT 335, CSIT 341, CSIT 411 and CSIT 425";
		if(courseNumber == 224)
			ret = "CSIT 312";
		if(courseNumber == 231)
			ret = "CSIT 431";
		if(courseNumber == 241)
			ret = "CSIT 242";
		if(courseNumber == 251)
			ret = "CSIT 351";
		if(courseNumber == 311)
			ret = "CSIT 413 and CSIT 431";
		if(courseNumber == 312)
			ret = "CSIT 413 and CSIT 431";
		if(courseNumber == 341)
			ret = "CSIT 390 and CSIT 431";
		if(courseNumber == 411)
			ret = "CSIT 433";
		
		return ret;
	}
	public String getPreReq(int courseNumber){
		String ret = "None";
		
		if(courseNumber == 205)
			ret = "CSIT 105 or CSIT 121";
		if(courseNumber == 207)
			ret = "CSIT 107 and (CSIT 105 or CSIT 121)";
		if(courseNumber == 221)
			ret = "CSIT 121";
		if(courseNumber == 224)
			ret = "CSIT 221";
		if(courseNumber == 225)
			ret = "CSIT 221";
		if(courseNumber == 231)
			ret = "CSIT 221";
		if(courseNumber == 241)
			ret = "CSIT 105 or CSIT 121";
		if(courseNumber == 242)
			ret = "CSIT 221 and CSIT 241";
		if(courseNumber == 251)
			ret = "CSIT 151 or CSIT 104";
		if(courseNumber == 311)
			ret = "CSIT 121";
		if(courseNumber == 312)
			ret = "CSIT 105 or CSIT 121";
		if(courseNumber == 321)
			ret = "CSIT 224";
		if(courseNumber == 335)
			ret = "CSIT 205 or CSIT 221";
		if(courseNumber == 341)
			ret = "CSIT 221 or CSIT 205";
		if(courseNumber == 351)
			ret = "CSIT 205 or CSIT 251";
		if(courseNumber == 390)
			ret = "CSIT 341";
		if(courseNumber == 411)
			ret = "CSIT 221";
		if(courseNumber == 413)
			ret = "CSIT 311 or CSIT 312";
		if(courseNumber == 425)
			ret = "CSIT 221 or CSIT 205";
		if(courseNumber == 431)
			ret = "(CSIT 311 or CSIT 312) and CSIT 341 and CSIT 231";
		if(courseNumber == 433)
			ret = "(CSIT 311 or CSIT 312) and CSIT 341";
		if(courseNumber == 435)
			ret = "CSIT 311 or CSIT 312 or CSIT 335";
		if(courseNumber == 436)
			ret = "CSIT 435";
		if(courseNumber == 437)
			ret = "CSIT 431";
		if(courseNumber == 441)
			ret = "CSIT 242 and CSIT 341";
		if(courseNumber == 443)
			ret = "CSIT 242 and CSIT 341";
		if(courseNumber == 451)
			ret = "CSIT 341";
		if(courseNumber == 456)
			ret = "CSIT 221 or CSIT 205";
		if(courseNumber == 461)
			ret = "CSIT 341 or CSIT 351";
		if(courseNumber == 462)
			ret = "CSIT 221 or CSIT 205";
		if(courseNumber == 463)
			ret = "CSIT 205 or CSIT 221";
		if(courseNumber == 473)
			ret = "CSIT 205 or CSIT 221";
		if(courseNumber == 475)
			ret = "(CSIT 205 or CSIT 221) and CSIT 207";
		if(courseNumber == 490)
			ret = "CSIT 341";
		if(courseNumber == 496)
			ret = "CSIT 341 or CSIT 351";
		if(courseNumber == 497)
			ret = "CSIT 341 or CSIT 351";
		if(courseNumber == 499)
			ret = "CSIT 341 or CSIT 351";
		if(courseNumber == 625)
			ret = "CSIT 425";
		if(courseNumber == 670)
			ret = "CSIT 341";
		
		return ret;
	}

}
