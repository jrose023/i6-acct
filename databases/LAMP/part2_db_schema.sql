
DROP TABLE IF EXISTS parks;
DROP TABLE IF EXISTS boroughs;
DROP TABLE IF EXISTS monuments;



DROP TABLE IF EXISTS boroughs;
CREATE TABLE boroughs(
	boro_name varchar(20) NOT NULL,
	PRIMARY KEY(boro_name)
);
INSERT INTO boroughs VALUES ("the Bronx");
INSERT INTO boroughs VALUES ("Manhattan");
INSERT INTO boroughs VALUES ("Brooklyn");
INSERT INTO boroughs VALUES ("Queens");
INSERT INTO boroughs VALUES ("Staten Isl");


DROP TABLE IF EXISTS parks;
CREATE TABLE parks(
	park_name varchar(30) NOT NULL,
	park_boro varchar(10),
	PRIMARY KEY(park_name),
	CONSTRAINT
		FOREIGN KEY (park_boro)
		REFERENCES boroughs (boro_name)
);
LOAD DATA LOCAL INFILE "NYC_Parks_Monuments.tsv"
INTO TABLE parks
IGNORE 1 LINES;


DROP TABLE IF EXISTS monuments;
CREATE TABLE monuments(
	mon_ID char(2),
	mon_name varchar(50),
	mon_park varchar(50),
	mon_desc text,
	mon_cost int(5),
	mon_img varchar(20),
	mon_url text,
	PRIMARY KEY(mon_ID),
  CONSTRAINT
		FOREIGN KEY (mon_park)
		REFERENCES parks (park_name)
);
INSERT INTO monuments VALUES ("913","Abraham Lincoln","Union Square Park","Standing figure (over life-size) with integral plinth on pedestal", NULL,"abe.jpg","https://www.nycgovparks.org/parks/union-square-park/monuments/913" );

INSERT INTO monuments VALUES ("569","Mohandas Gandhi","Union Square Park","Standing figure (over life-size) with integral plinth on pedestal with plaque", NULL,"gandhi.jpg","https://www.nycgovparks.org/parks/union-square-park/monuments/569" );

INSERT INTO monuments VALUES ("1657","Washington Square Arch","Washington Square Park","Triumphal arch, with two eagles, spandrel figures, two pier sculptures", NULL,"arch.jpg","https://www.nycgovparks.org/parks/washington-square-park/monuments/1657" );

INSERT INTO monuments VALUES ("59","Astoria Park War Memorial","Astoria Park","Stele with bas-relief on pedestal on stepped base", NULL,"war.jpg","https://www.nycgovparks.org/parks/astoria-park/monuments/59" );

INSERT INTO monuments VALUES ("721","Highest Natural Point in Manhattan","Bennett Park","Marker on natural boulder",NULL,"wahi.jpg","https://www.nycgovparks.org/parks/bennett-park/monuments/721" );

INSERT INTO monuments VALUES ("1896","Holocaust Memorial Mall","Cherry Mall","Tower consisting of brickwork partially concealing fourteen vertical bars supporting crown with beacon at top, three-tiered base, horizontal marker, approximately one hundred rough-hewn varisized vertical markers, two evergreen trees, evergreen shrubs", 697000,"mall.jpg","https://www.nycgovparks.org/parks/holocaust-memorial-park-bt10/monuments/1896" );

INSERT INTO monuments VALUES ("253","City Island World War Memorial","City Island Park","One vertical stele w. plaque;  two horiz. steles with plaques; flagstaff w. sign", NULL,"island.jpg","https://www.nycgovparks.org/parks/hawkins-park/monuments/253" );

INSERT INTO monuments VALUES ("1913","A Bird Named Goldilocks","Clove Lakes Park","Hollowed out tree-stump form with a bird at a 'fairy-sized table setting' in the hollow, placed at ground level, with information plaque in pavement in front of sculpture", NULL,"fairy.jpg","https://www.nycgovparks.org/parks/clove-lakes-park/monuments/1913");

INSERT INTO monuments VALUES ("1761","Neptune Fountain","Sailors Snug Harbor","Male figure (heroic scale) atop basin; original zinc figure is Visitor's Center", 620350,"neptune.jpg","https://www.nycgovparks.org/parks/sailors-snug-harbor/monuments/1761" );

INSERT INTO monuments VALUES ("1344","Riis, Jacob A.","Jacob Riis Park","bust, pedestal - bust stolen 6/13/64", NULL,"riis.jpg","https://www.nps.gov/gate/riis-bust-unveiling.htm" );

INSERT INTO monuments VALUES ("302","Columnade","Fort Tryon Park","Two upright, continuous lengths of cast material in a U-attached- to- inverted-U pattern, aligned side by side", NULL,"column.jpg","https://www.nycgovparks.org/parks/fort-tryon-park/monuments/302" );

INSERT INTO monuments VALUES ("1071","Mozart Memorial","Prospect Park","Bust (heroic scale) on pedestal decorated with applied wreath", 6000,"mozart.jpg","https://www.nycgovparks.org/parks/prospect-park/monuments/1071" );
