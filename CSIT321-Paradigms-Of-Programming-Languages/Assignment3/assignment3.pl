course(100).

course(101).

course(104).

course(105).

course(107).

course(120).

course(121).

course(151).

course(201).

course(203).

course(205).

course(207).

course(221).

course(224).

course(225).

course(231).

course(241).

course(242).

course(251).

course(300).

course(305).

course(311).

course(312).

course(321).

course(335).

course(341).

course(351).

course(390).

course(400).

course(411).

course(413).

course(425).

course(431).

course(433).

course(435).

course(436).

course(437).

course(441).

course(443).

course(451).

course(456).

course(461).

course(462).

course(463).

course(471).

course(473).

course(475).

course(490).

course(496).

course(497).

course(499).

course(536).

course(537).

course(541).

course(542).

course(580).

course(591).

course(613).

course(625).

course(636).

course(639).

course(649).

course(665).

course(669).

course(670).

course(672).



% The second is required to take the first

prereq(205, 105).

prereq(205, 121).

prereq(207, 107).

prereq(207, 105).

prereq(207, 121).

prereq(221, 121).

prereq(224, 221).

prereq(225, 221).

prereq(231, 221).

prereq(241, 105).

prereq(241, 121).

prereq(242, 241).

prereq(242, 221).

prereq(251, 151).

prereq(251, 104).

prereq(311, 121).

prereq(312, 121).

prereq(312, 105).

prereq(321, 224).

prereq(335, 205).

prereq(335, 221).

prereq(341, 205).

prereq(341, 221).

prereq(351, 205).

prereq(351, 251).

prereq(390, 341).

prereq(411, 221).

prereq(413, 311).

prereq(413, 312).

prereq(425, 221).

prereq(425, 205).

prereq(431, 311).

prereq(431, 312).

prereq(431, 341).

prereq(431, 231).

prereq(433, 311).

prereq(433, 312).

prereq(433, 341).

prereq(435, 311).

prereq(435, 312).

prereq(435, 335).

prereq(436, 435).

prereq(437, 431).

prereq(441, 242).

prereq(441, 341).

prereq(443, 242).

prereq(443, 341).

prereq(451, 341).

prereq(455, 221).

prereq(455, 205).

prereq(456, 341).

prereq(456, 351).

prereq(461, 205).

prereq(461, 221).

prereq(462, 221).

prereq(462, 205).

prereq(463, 205).

prereq(463, 221).

prereq(471, 221).

prereq(471, 205).

prereq(473, 205).

prereq(473, 221).

prereq(475, 205).

prereq(475, 221).

prereq(475, 207).

prereq(490, 341).

prereq(496, 341).

prereq(496, 351).

prereq(497, 341).

prereq(497, 351).

prereq(499, 341).

prereq(499, 351).

prereq(670, 341).



% The second can be taken after the first

postreq(105, 205).

postreq(121, 205).

postreq(107, 207).

postreq(105, 207).

postreq(121, 207).

postreq(121, 221).

postreq(221, 224).

postreq(221, 225).

postreq(221, 231).

postreq(105, 241).

postreq(121, 241).

postreq(241, 242).

postreq(221, 242).

postreq(151, 251).

postreq(104, 251).

postreq(121, 311).

postreq(121, 312).

postreq(105, 312).

postreq(224, 312).

postreq(205, 335).

postreq(221, 335).

postreq(205, 341).

postreq(221, 341).

postreq(205, 351).

postreq(251, 351).

postreq(341, 390).

postreq(221, 411).

postreq(311, 413).

postreq(312, 413).

postreq(221, 425).

postreq(205, 425).

postreq(311, 431).

postreq(312, 431).

postreq(341, 431).

postreq(231, 431).

postreq(411, 433).

postreq(312, 433).

postreq(341, 433).

postreq(311, 435).

postreq(312, 435).

postreq(335, 435).

postreq(435, 436).

postreq(431, 437).

postreq(242, 441).

postreq(341, 441).

postreq(242, 443).

postreq(341, 443).

postreq(341, 451).

postreq(221, 455).

postreq(205, 455).

postreq(341, 456).

postreq(351, 456).

postreq(205, 461).

postreq(221, 461).

postreq(221, 462).

postreq(205, 462).

postreq(205, 463).

postreq(221, 463).

postreq(221, 471).

postreq(205, 471).

postreq(205, 473).

postreq(221, 473).

postreq(201, 475).

postreq(221, 475).

postreq(207, 475).

postreq(341, 490).

postreq(341, 496).

postreq(351, 496).

postreq(341, 497).

postreq(351, 497).

postreq(341, 499).

postreq(351, 499).

postreq(341, 670).



canTake(X) :- prereq(X, Y),!,postreq(Y, X).
