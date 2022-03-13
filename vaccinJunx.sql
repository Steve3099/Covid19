 CREATE TABLE Article(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     titre VARCHAR(30),
     texte TEXT,
     image BLOB,
     date DATE
 );

 CREATE TABLE Personne(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nom VARCHAR(50),
     prenom VARCHAR(50),
     dtn DATE,
     cin VARCHAR(50)
 );

CREATE TABLE Vaccination(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idPersonne INTEGER,
    date DATE,
    idVaccin INTEGER
);

 CREATE TABLE Vaccin(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     label VARCHAR(50),
     info TEXT,
     effetsecondaire TEXT
 );

 CREATE TABLE ComposantVaccin(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     idVaccin INTEGER,
     composant TEXT
 );

 CREATE TABLE Infecte(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     date DATE,
     idPersonne INTEGER,
     casgrave INTEGER
 );

 CREATE TABLE MaladieChronique(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     label VARCHAR(50)
 );

 CREATE TABLE ContreIndication(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     idVaccin INTEGER,
     idMaladieChronique INTEGER
 );




 CREATE TABLE Resultat(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     idInfecte INTEGER,
     date DATE,
     resultat VARCHAR(20)
 );

 CREATE TABLE ResultatVaccination(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     idVaccination INTEGER,
     date DATE,
     resultat VARCHAR(20)
 );

<<<<<<< Updated upstream
CREATE TABLE Reservation(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom varchar(40),
    prenom varchar(40),
    dateNaissance DATE,
    cin varchar (60),
    sexe varchar(1),
    numero varchar(40),
    adresse varchar(50),
    mail varchar(20),
    idCentre INTEGER,
    idVaccin INTEGER,
    date DATE
);
=======
 CREATE TABLE Centre(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     label VARCHAR(50),
     region VARCHAR(50),
     district VARCHAR(50)
 );

 CREATE TABLE VaccinCentre(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     idCentre INTEGER,
     idVaccin INTEGER
 );

 CREATE TABLE Reservation(
     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     idCentre INTEGER,
     idVaccin INTEGER,
     date DATE
 );
>>>>>>> Stashed changes

create table ReservationMaladie(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idReservation INTEGER,
    idMaladieChronique integer
);

alter table ReservationMaladie add foreign key (idReservation) references Reservation(id);
alter table ReservationMaladie add foreign key (idMaladieChronique) references MaladieChronique(id);

ALTER TABLE Vaccination ADD foreign key (idPersonne) references Personne(id);
ALTER TABLE Vaccination ADD foreign key (idVaccin) references Vaccin(id);
ALTER TABLE ComposantVaccin ADD foreign key (idVaccin) references Vaccin(id);
ALTER TABLE Infecte ADD foreign key (idPersonne) references Personne(id);
ALTER TABLE ContreIndication ADD foreign key (idVaccin) references Vaccin(id);
ALTER TABLE ContreIndication ADD foreign key (idMaladieChronique) references MaladieChronique(id);
ALTER TABLE Resultat ADD foreign key (idInfecte) references Infecte(id);
ALTER TABLE VaccinCentre ADD foreign key (idCentre) references Centre(id);
ALTER TABLE VaccinCentre ADD foreign key (idVaccin) references Vaccin(id);
ALTER TABLE Reservation ADD foreign key (idCentre) references Centre(id);
ALTER TABLE Reservation ADD foreign key (idVaccin) references Vaccin(id);


ALTER TABLE ResultatVaccination ADD foreign key (idVaccination) references Vaccination(id);

create or replace view nombreVaccine as select count(*) as nbr from Personne p join Vaccination v on v.idPersonne = p.id;

create or replace view nombreParVaccin as
select idVaccin,count(*) as nbr from Vaccin v left join Vaccination vn on v.id=idVaccin group by idVaccin;

create or replace view nombreMararyVaccine as
select idVaccin,count(*) as nbr from Infecte i join Vaccination v on v.idPersonne=i.idPersonne group by idVaccin;

create or replace view nombreVaccineMaty as
select idVaccin,count(*) as nbr from resultat r 
join Infecte i on i.id=r.idInfecte 
join Vaccination v on v.idPersonne=i.idPersonne
where resultat='decede' and v.date<i.date
group by idVaccin;

create or replace view nombreGuerie as
select count(*) as nbr from resultat r where resultat='guerie';

create or replace view nombreDecede as 
select count(*) as nbr from resultat r where resultat='decede';






INSERT INTO personne (id,nom,prenom,dtn,cin)
VALUES
  (1,"Deirdre Conner","Colette Holman","1994-06-03","6752"),
  (2,"Jada Padilla","Jasper Lambert","2001-01-24","8631"),
  (3,"Oliver Trujillo","Wade Gomez","1998-04-17","515452"),
  (4,"Leo Salinas","Freya Velazquez","1998-04-19","452021"),
  (5,"Vivien Rollins","Bianca Nielsen","1994-09-20","30906"),
  (6,"Kennan Knowles","Amethyst Cooper","1999-03-31","50112"),
  (7,"Coby Chen","Eric Fernandez","1998-10-11","544672"),
  (8,"Acton Black","Buckminster Barron","1996-03-15","11705"),
  (9,"Chester Mclean","Leslie Dickson","1995-11-15","9551"),
  (10,"Joan Castro","Zahir Mcpherson","1996-06-06","759287");
INSERT INTO personne (id,nom,prenom,dtn,cin)
VALUES
  (11,"Zachery Reese","Evelyn Case","1994-11-19","1262"),
  (12,"William Davidson","Deacon Burgess","1997-03-21","463883"),
  (13,"Maryam Wiggins","Lunea Chan","1997-06-25","NC4F 2RE"),
  (14,"Jameson Bullock","Kareem Bonner","1997-10-04","57984"),
  (15,"Susan Holland","Alea Donaldson","1999-09-09","56-035"),
  (16,"Uriah Lee","Ariel Jones","1994-09-22","7288"),
  (17,"Dahlia Matthews","Venus Burks","1996-03-30","R1C 1L7"),
  (18,"Kieran Hammond","Kathleen Hebert","1997-08-21","4077"),
  (19,"Carlos Oneal","Adam Miles","1999-09-28","78236"),
  (20,"Rama Simpson","Bree Guerra","2000-10-16","51101");
INSERT INTO personne (id,nom,prenom,dtn,cin)
VALUES
  (21,"Acton Kane","Emmanuel Gross","1995-01-20","378664"),
  (22,"Hamish Landry","Wyatt Cotton","1997-06-27","120172"),
  (23,"Xenos Underwood","Illiana Berger","1999-03-30","21812"),
  (24,"Duncan Hopkins","Nayda Barber","1995-08-02","237921"),
  (25,"Kalia Chambers","Armand Ballard","2000-02-27","65062-542"),
  (26,"Xena Schultz","Barrett Hardin","1999-02-06","14286"),
  (27,"Wilma Stuart","Joelle Silva","1994-03-14","2814"),
  (28,"Castor Foreman","Addison House","1998-07-27","49887"),
  (29,"Fletcher Ruiz","Winter Winters","1996-03-01","M6W 5S1"),
  (30,"Yasir Howell","Neil Cotton","1997-08-18","433472");
INSERT INTO personne (id,nom,prenom,dtn,cin)
VALUES
  (31,"Scarlet Garner","Imelda Baldwin","1996-12-06","71914"),
  (32,"Julian Rosales","Amal Mercer","1997-04-08","725057"),
  (33,"Azalia Fuentes","Stewart Case","1999-12-07","24218"),
  (34,"Hector Shaw","Charlotte Snow","1995-04-29","157989"),
  (35,"Judah Mitchell","Carson Williams","1998-12-11","4020"),
  (36,"Benjamin Owens","Cally Skinner","1998-05-24","5133"),
  (37,"Simone Nguyen","Honorato Snider","1994-04-05","5146"),
  (38,"Hilary Mccormick","Lacy Webster","1995-07-17","57557"),
  (39,"Fitzgerald Avila","Elton Guerrero","1994-08-30","7726 HT"),
  (40,"Sydney Doyle","Kyla Griffin","1994-10-02","994560");
INSERT INTO personne (id,nom,prenom,dtn,cin)
VALUES
  (41,"Tatiana Powell","Orlando Guzman","1996-06-23","7759"),
  (42,"Clinton Bruce","Orli Dickson","1997-02-09","30535"),
  (43,"Gary Sampson","Gary Young","2001-03-09","31726"),
  (44,"Deirdre Mckenzie","Acton Fitzgerald","1997-12-23","34596"),
  (45,"Quamar Myers","Lance Stephenson","1996-12-06","837578"),
  (46,"Iris Blanchard","Aurora Noel","1995-11-19","2024"),
  (47,"Adam Mcknight","Keegan Matthews","2000-10-09","60105"),
  (48,"Illiana Petty","Ruth Nguyen","1998-05-28","53-587"),
  (49,"Dustin Guy","Michael Donovan","1994-05-18","6523"),
  (50,"Shaeleigh Gay","Logan Martinez","2000-06-10","820117");



INSERT INTO article (id,titre,texte,image,date)
VALUES
  (1,"Utah","ligula Aenean gravida",null,"1999-02-06"),
  (2,"Quebec","hendrerit consectetuer, cursus et, magna",null,"2001-03-08"),
  (3,"Bauchi","Praesent eu dui Cum sociis natoque",null,"1996-02-18"),
  (4,"Kolo","Sed",null,"1995-06-08"),
  (5,"Southwestern Tagalog Region","natoque penatibus",null,"1998-04-05"),
  (6,"Mijai","quis massa Mauris vestibulum, neque sed dictum eleifend, nunc risus",null,"1995-11-10"),
  (7,"Heredia","nec ligula consectetuer rhoncus Nullam velit",null,"1996-04-28"),
  (8,"Central Region","fringilla purus mauris a",null,"1998-11-12"),
  (9,"Tolima","in faucibus orci luctus et ultrices posuere",null,"1994-10-08"),
  (10,"South Jeolla","feugiat Sed nec metus facilisis lorem tristique aliquet Phasellus",null,"1997-03-11");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (11,"Aisén","Donec porttitor",null,"1997-08-05"),
  (12,"Free State","porttitor scelerisque neque Nullam nisl Maecenas",null,"1996-08-25"),
  (13,"Piemonte","pede et risus Quisque libero lacus, varius et,",null,"1995-01-03"),
  (14,"Luxemburg","elit, pellentesque a, facilisis non, bibendum sed, est",null,"1998-09-03"),
  (15,"Tasmania","ipsum ac mi eleifend egestas Sed pharetra, felis eget varius",null,"1998-02-28"),
  (16,"Alberta","amet lorem semper auctor Mauris vel turpis Aliquam adipiscing",null,"1997-06-30"),
  (17,"Comunitat Valenciana","Nulla eu neque pellentesque massa lobortis ultrices Vivamus rhoncus Donec",null,"1996-05-16"),
  (18,"Nagaland","mattis Cras",null,"1999-12-16"),
  (19,"Western Australia","tempor, est ac mattis semper, dui lectus rutrum urna, nec",null,"1999-04-10"),
  (20,"Montgomeryshire","Phasellus nulla Integer vulputate, risus a ultricies adipiscing,",null,"1998-04-20");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (21,"Overijssel","Etiam",null,"1998-04-14"),
  (22,"Punjab","Donec felis orci, adipiscing non, luctus sit amet, faucibus",null,"1994-10-11"),
  (23,"Daman and Diu","vulputate ullamcorper magna Sed eu eros Nam",null,"1998-11-11"),
  (24,"Guanajuato","lacus vestibulum lorem, sit amet ultricies",null,"2000-10-05"),
  (25,"Overijssel","lobortis tellus",null,"1997-04-11"),
  (26,"Daman and Diu","convallis",null,"1998-04-15"),
  (27,"Australian Capital Territory","porttitor interdum Sed auctor odio a",null,"2001-02-23"),
  (28,"Los Lagos","neque pellentesque massa lobortis",null,"1995-10-16"),
  (29,"Mpumalanga","odio semper cursus Integer mollis Integer",null,"1995-11-04"),
  (30,"Waals-Brabant","volutpat nunc",null,"1999-07-21");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (31,"Cajamarca","a,",null,"2000-07-07"),
  (32,"Murcia","ac tellus Suspendisse sed dolor",null,"1999-10-08"),
  (33,"Santa Catarina","iaculis odio Nam",null,"1998-02-07"),
  (34,"Ulyanovsk Oblast","Nullam feugiat",null,"1996-05-11"),
  (35,"Languedoc-Roussillon","consectetuer, cursus et, magna Praesent interdum ligula",null,"1997-01-15"),
  (36,"Hung Yen","ridiculus mus",null,"1996-08-13"),
  (37,"Troms og Finnmark","felis Nulla",null,"2000-07-25"),
  (38,"Belgorod Oblast","odio tristique pharetra Quisque ac",null,"1997-05-26"),
  (39,"Pays de la Loire","neque Sed eget",null,"1996-03-27"),
  (40,"Heredia","lacinia at, iaculis quis, pede Praesent eu dui",null,"2000-08-09");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (41,"North Region","mauris erat eget ipsum Suspendisse sagittis Nullam",null,"1995-11-20"),
  (42,"Kaduna","aliquet molestie tellus Aenean egestas hendrerit",null,"1998-12-10"),
  (43,"Overijssel","Nunc mauris elit, dictum eu,",null,"1997-08-25"),
  (44,"Heredia","Aliquam auctor,",null,"1994-03-26"),
  (45,"North Gyeongsang","tristique",null,"1995-03-30"),
  (46,"Comunitat Valenciana","est ac facilisis facilisis, magna tellus faucibus leo,",null,"1996-12-22"),
  (47,"Kansas","rhoncus Nullam velit dui, semper et, lacinia vitae, sodales",null,"1996-05-10"),
  (48,"ostergotlands len","blandit Nam nulla magna, malesuada vel, convallis in,",null,"1998-08-15"),
  (49,"Uttar Pradesh","ligula consectetuer rhoncus",null,"2000-09-13"),
  (50,"Castilla - La Mancha","purus Maecenas libero est, congue a, aliquet",null,"1998-06-01");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (51,"Centre","Donec non justo Proin non",null,"1999-07-11"),
  (52,"Anglesey","taciti sociosqu ad",null,"1994-04-28"),
  (53,"Donetsk oblast","odio vel est tempor bibendum Donec felis orci, adipiscing non,",null,"1997-04-03"),
  (54,"Konya","et ultrices posuere cubilia Curae Phasellus ornare Fusce",null,"1999-06-17"),
  (55,"Limon","auctor odio a",null,"1998-01-04"),
  (56,"Southwestern Tagalog Region","non leo Vivamus nibh",null,"2000-03-12"),
  (57,"Valparaíso","vehicula aliquet libero Integer in magna Phasellus dolor elit,",null,"1995-09-29"),
  (58,"Saarland","molestie Sed id risus quis diam",null,"2000-09-02"),
  (59,"Zuid Holland","Cras vehicula aliquet libero Integer in",null,"2000-04-23"),
  (60,"Michoacán","Nullam velit dui, semper et,",null,"2000-07-08");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (61,"Manisa","turpis egestas Fusce aliquet magna",null,"1994-10-04"),
  (62,"Free State","Maecenas libero est, congue",null,"1999-04-29"),
  (63,"Sinaloa","vitae dolor Donec fringilla Donec feugiat metus",null,"1996-07-14"),
  (64,"Stockholms län","felis, adipiscing fringilla, porttitor vulputate,",null,"1998-08-25"),
  (65,"xine","in magna Phasellus",null,"1998-11-12"),
  (66,"Noord Holland","fermentum vel, mauris Integer sem elit, pharetra ut, pharetra",null,"1996-02-07"),
  (67,"Xzzn","molestie dapibus ligula",null,"1998-01-19"),
  (68,"Aydan","sollicitudin a,",null,"1996-10-03"),
  (69,"Aceh","quis, pede",null,"1995-08-12"),
  (70,"Cartago","Integer id magna et ipsum cursus vestibulum Mauris",null,"1998-02-11");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (71,"Los Rios","vestibulum nec,",null,"1999-10-17"),
  (72,"Warmihsko-mazurskie","dictum mi, ac mattis",null,"2000-02-09"),
  (73,"Auvergne","Vestibulum accumsan neque et nunc",null,"1997-02-26"),
  (74,"North Gyeongsang","quis, tristique ac,",null,"1995-04-14"),
  (75,"Tamil Nadu","Nullam suscipit, est",null,"1999-12-31"),
  (76,"Volyn oblast","pellentesque, tellus sem mollis",null,"1997-01-13"),
  (77,"Vichada","varius ultrices, mauris ipsum porta elit, a feugiat",null,"1996-05-09"),
  (78,"Queensland","fringilla, porttitor vulputate, posuere vulputate, lacus Cras interdum",null,"1999-11-17"),
  (79,"Nottinghamshire","nonummy ipsum non arcu Vivamus",null,"1995-07-12"),
  (80,"Prince Edward Island","nunc,",null,"2000-01-20");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (81,"Queensland","gravida mauris ut mi",null,"1998-08-07"),
  (82,"Samsun","semper pretium",null,"1997-12-27"),
  (83,"Bolzvar","arcu Morbi sit amet massa Quisque porttitor eros nec",null,"1994-07-11"),
  (84,"Newfoundland and Labrador","sodales at, velit Pellentesque ultricies",null,"1994-08-31"),
  (85,"Magallanes y Antártica Chilena","non, feugiat nec, diam Duis mi enim,",null,"1994-03-30"),
  (86,"Northern Territory","magna Praesent interdum ligula",null,"1995-09-13"),
  (87,"Oklahoma","massa Integer vitae nibh Donec est mauris, rhoncus id,",null,"1995-02-11"),
  (88,"Lambayeque","ullamcorper, velit",null,"1999-10-20"),
  (89,"Hessen","ipsum leo elementum sem, vitae aliquam eros turpis non",null,"2000-02-12"),
  (90,"Noord Holland","Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,",null,"1995-08-13");
INSERT INTO article (id,titre,texte,image,date)
VALUES
  (91,"Lima","Quisque ac libero nec ligula consectetuer",null,"1998-04-03"),
  (92,"Nevada","molestie tellus Aenean egestas hendrerit neque",null,"1997-05-26"),
  (93,"Limpopo","Aliquam",null,"1997-07-22"),
  (94,"Gavleborgs lin","luctus",null,"1995-01-18"),
  (95,"Alajuela","arcu Morbi sit amet massa",null,"1995-10-28"),
  (96,"Northwest Territories","dignissim pharetra Nam ac nulla In tincidunt congue",null,"1995-03-03"),
  (97,"Troms og Finnmark","in aliquet lobortis, nisi nibh lacinia orci,",null,"1999-11-28"),
  (98,"Limousin","libero Proin mi Aliquam gravida mauris ut mi Duis risus",null,"1998-04-24"),
  (99,"Sindh","ac nulla",null,"1999-07-16"),
  (100,"Huabei","id ante dictum cursus Nunc mauris elit,",null,"1998-08-10");





INSERT INTO vaccin (id,label,info,effetSecondaire)
VALUES
  (1,"Central Region","In condimentum. Donec at arcu. Vestibulum ante","toux"),
  (2,"Cần Thơ","sociis natoque","nausée"),
  (3,"FATA","taciti sociosqu ad litora torquent per conubia nostra,","maux de tete"),
  (4,"Istanbul","ipsum. Curabitur consequat, lectus sit amet luctus vulputate,","toux"),
  (5,"KwaZulu-Natal","taciti sociosqu ad litora torquent per conubia nostra, per inceptos","fatigue"),
  (6,"Samsun","magna. Lorem ipsum dolor sit amet,","maux de tete"),
  (7,"Vestfold og Telemark","erat. Sed nunc est, mollis non, cursus non, egestas","vomis"),
  (8,"Paraíba","egestas rhoncus. Proin nisl sem,","maux de tete"),
  (9,"Tasmania","elit, pharetra ut, pharetra sed, hendrerit a, arcu.","toux"),
  (10,"Western Australia","pede. Praesent eu dui. Cum sociis natoque penatibus","vomis");


INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (1,"1999-01-23",35,1),
  (2,"2000-10-26",20,1),
  (3,"1999-05-01",45,0),
  (4,"1994-07-30",11,1),
  (5,"1996-12-13",34,0),
  (6,"1998-09-28",19,0),
  (7,"1999-09-24",22,1),
  (8,"1999-09-27",9,0),
  (9,"1999-08-15",36,0),
  (10,"1995-04-09",19,0);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (11,"1998-05-08",27,1),
  (12,"1999-06-14",9,0),
  (13,"1996-07-10",18,0),
  (14,"2000-02-27",20,1),
  (15,"2001-02-01",42,0),
  (16,"1995-09-06",32,1),
  (17,"1995-11-10",18,0),
  (18,"1994-12-17",17,1),
  (19,"2000-10-01",2,0),
  (20,"1996-04-24",9,1);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (21,"1994-05-07",12,1),
  (22,"1998-12-06",13,1),
  (23,"1999-05-28",11,1),
  (24,"1999-03-30",8,0),
  (25,"1998-02-12",8,1),
  (26,"1998-02-03",5,0),
  (27,"1994-03-24",46,1),
  (28,"1995-10-04",32,0),
  (29,"1999-07-13",32,0),
  (30,"1999-03-02",40,1);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (31,"2000-03-24",3,0),
  (32,"1995-04-28",26,0),
  (33,"1996-11-03",23,0),
  (34,"1997-11-21",40,0),
  (35,"1994-05-02",37,0),
  (36,"1995-09-20",39,1),
  (37,"1999-11-08",20,1),
  (38,"2001-01-14",15,0),
  (39,"1994-10-28",39,1),
  (40,"1996-04-06",17,1);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (41,"1999-09-29",7,1),
  (42,"1997-05-15",14,1),
  (43,"1995-12-20",25,1),
  (44,"1999-03-25",29,0),
  (45,"1996-02-14",9,1),
  (46,"1995-07-21",9,1),
  (47,"1999-11-28",39,0),
  (48,"2000-03-27",20,1),
  (49,"1996-10-28",41,1),
  (50,"1996-10-18",43,1);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (51,"1999-11-11",19,0),
  (52,"1998-09-04",49,0),
  (53,"1998-09-05",19,1),
  (54,"1995-03-12",31,0),
  (55,"2000-03-01",21,0),
  (56,"2001-03-09",11,1),
  (57,"1995-07-27",21,1),
  (58,"1998-02-27",24,1),
  (59,"1998-10-10",25,0),
  (60,"1999-10-15",28,1);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (61,"1997-05-20",24,1),
  (62,"2000-10-11",44,0),
  (63,"1999-11-24",36,0),
  (64,"1998-03-20",39,0),
  (65,"1995-07-15",22,0),
  (66,"1995-10-07",29,1),
  (67,"1999-12-29",35,0),
  (68,"1995-02-08",1,0),
  (69,"1996-10-05",34,1),
  (70,"1996-11-26",28,0);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (71,"1995-09-24",14,0),
  (72,"2000-03-28",17,0),
  (73,"1998-10-24",21,0),
  (74,"1997-05-09",7,1),
  (75,"1994-09-07",23,1),
  (76,"2001-02-11",36,1),
  (77,"1994-04-16",43,1),
  (78,"1995-05-02",4,1),
  (79,"1995-02-07",38,0),
  (80,"1999-04-21",28,0);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (81,"1994-05-23",40,0),
  (82,"1997-02-10",42,0),
  (83,"1996-10-08",30,0),
  (84,"1999-06-02",12,1),
  (85,"1995-12-26",15,0),
  (86,"1995-07-11",46,0),
  (87,"1995-11-03",20,1),
  (88,"1996-04-09",12,0),
  (89,"1996-11-23",2,0),
  (90,"1997-05-02",37,1);
INSERT INTO infecte (id,date,idPersonne,casgrave)
VALUES
  (91,"1996-09-26",18,1),
  (92,"1996-02-27",45,1),
  (93,"1999-07-31",34,0),
  (94,"2000-01-23",29,1),
  (95,"1994-03-18",38,1),
  (96,"1996-11-04",19,1),
  (97,"2000-10-22",22,1),
  (98,"1998-06-20",22,0),
  (99,"1995-03-13",14,0),
  (100,"1996-12-17",6,1);


INSERT INTO composantVaccin (id,idVaccin,composant)
VALUES
  (1,7,""),
  (2,5,""),
  (3,5,""),
  (4,10,""),
  (5,6,""),
  (6,7,""),
  (7,4,""),
  (8,7,""),
  (9,6,""),
  (10,5,"");




INSERT INTO MaladieChronique (id,label)
VALUES
  (1,"Nicoya"),
  (2,"Siquirres"),
  (3,"Minitonas"),
  (4,"Jefferson City"),
  (5,"Kenosha"),
  (6,"Gia Nghĩa"),
  (7,"Kano"),
  (8,"Amiens"),
  (9,"Waidhofen an der Ybbs"),
  (10,"Beerzel");
INSERT INTO MaladieChronique (id,label)
VALUES
  (11,"Dufftown"),
  (12,"Sloten"),
  (13,"Jurong East"),
  (14,"Castelnovo del Friuli"),
  (15,"Vosselaar"),
  (16,"Loy"),
  (17,"Nova Iguaçu"),
  (18,"Floridablanca"),
  (19,"Ang Mo Kio"),
  (20,"Jilin");


INSERT INTO ContreIndication (id,idVaccin,idMaladieChronique)
VALUES
  (1,2,13),
  (2,6,7),
  (3,2,12),
  (4,3,20),
  (5,8,8),
  (6,5,16),
  (7,1,10),
  (8,7,1),
  (9,7,5),
  (10,3,17);
INSERT INTO ContreIndication (id,idVaccin,idMaladieChronique)
VALUES
  (11,2,12),
  (12,3,8),
  (13,9,12),
  (14,2,8),
  (15,4,13),
  (16,5,13),
  (17,1,19),
  (18,1,14),
  (19,8,2),
  (20,2,14);




INSERT INTO Centre (id,label,region,district)
VALUES
  (1,"South Africa","Villahermosa","North Sumatra"),
  (2,"Netherlands","Alto del Carmen","FATA"),
  (3,"Brazil","Bostaniçi","Boyacá"),
  (4,"New Zealand","Cork","North Region"),
  (5,"China","Bexbach","FATA"),
  (6,"Nigeria","Greater Hobart","Ancash"),
  (7,"France","Avesta","Bolívar"),
  (8,"Brazil","Sankt Johann im Pongau","Zachodniopomorskie"),
  (9,"Philippines","Pekanbaru","Maranhão"),
  (10,"Netherlands","Trà Vinh","Cordillera Administrative Region");
INSERT INTO Centre (id,label,region,district)
VALUES
  (11,"Russian Federation","Waiblingen","Biobío"),
  (12,"Indonesia","Hong Kong","Bourgogne"),
  (13,"Nigeria","Wanaka","South Island"),
  (14,"Singapore","Rocca d'Arce","West Region"),
  (15,"Russian Federation","Weiz","Trøndelag"),
  (16,"Austria","Marentino","Valle d'Aosta"),
  (17,"Colombia","Floridablanca","South Island"),
  (18,"Ireland","Ashburton","Zaporizhzhia oblast"),
  (19,"Colombia","Gujranwala","Cartago"),
  (20,"Canada","Mohmand Agency","Riau Islands");
INSERT INTO Centre (id,label,region,district)
VALUES
  (21,"Pakistan","Palu","Rogaland"),
  (22,"China","Tengah","South Jeolla"),
  (23,"Austria","San Pedro Garza García","Khyber Pakhtoonkhwa"),
  (24,"Indonesia","Ruza","Northwest Territories"),
  (25,"South Africa","Opole","Antalya"),
  (26,"Ukraine","Vị Thanh","Sachsen"),
  (27,"Indonesia","Ocaña","Central Visayas"),
  (28,"Italy","Soledad de Graciano Sánchez","Xīběi"),
  (29,"Indonesia","Cork","Ancash"),
  (30,"Costa Rica","Tagum","Sachsen-Anhalt");
INSERT INTO Centre (id,label,region,district)
VALUES
  (31,"Ireland","Noville","Guanacaste"),
  (32,"Italy","Dangjin","Uttar Pradesh"),
  (33,"India","Huế","Bretagne"),
  (34,"Belgium","Rostock","Henegouwen"),
  (35,"Indonesia","Sosnowiec","Oyo"),
  (36,"India","Salzburg","Nizhny Novgorod Oblast"),
  (37,"Vietnam","Dublin","Rostov Oblast"),
  (38,"United States","Hà Giang","Perthshire"),
  (39,"Belgium","Roccabruna","Vorarlberg"),
  (40,"Colombia","Te Awamutu","Midi-Pyrénées");
INSERT INTO Centre (id,label,region,district)
VALUES
  (41,"China","Zutphen","Australian Capital Territory"),
  (42,"New Zealand","Las Palmas","Rivne oblast"),
  (43,"Vietnam","Mercedes","Lviv oblast"),
  (44,"China","Puerto Octay","Xīběi"),
  (45,"Russian Federation","Miramichi","Sachsen"),
  (46,"Spain","Cochrane","Piura"),
  (47,"Belgium","Sechura","Brandenburg"),
  (48,"United States","Attimis","Valle d'Aosta"),
  (49,"Austria","Mora","Munster"),
  (50,"China","Monte Patria","North Gyeongsang");
INSERT INTO Centre (id,label,region,district)
VALUES
  (51,"Ukraine","Acquasanta Terme","Stockholms län"),
  (52,"Chile","Tunja","Sicilia"),
  (53,"South Africa","Narbonne","Cusco"),
  (54,"New Zealand","Wageningen","Burgenland"),
  (55,"Vietnam","Vị Thanh","Alajuela"),
  (56,"India","Pleiku","Euskadi"),
  (57,"India","Knittelfeld","Ulster"),
  (58,"Chile","Tame","Bahia"),
  (59,"Pakistan","Lienz","Lower Austria"),
  (60,"United Kingdom","Dutse","Heredia");
INSERT INTO Centre (id,label,region,district)
VALUES
  (61,"Russian Federation","Khmelnytskyi","Osun"),
  (62,"Costa Rica","Mardan","Punjab"),
  (63,"Norway","Lipetsk","Troms og Finnmark"),
  (64,"Turkey","Canterbury","Oaxaca"),
  (65,"Italy","Rae-Edzo","Akwa Ibom"),
  (66,"Germany","Quezon City","Stockholms län"),
  (67,"United States","Belfast","Newfoundland and Labrador"),
  (68,"Germany","Bydgoszcz","Vorarlberg"),
  (69,"Austria","Acquasparta","Loreto"),
  (70,"Nigeria","Reims","Louisiana");
INSERT INTO Centre (id,label,region,district)
VALUES
  (71,"United Kingdom","Murmansk","Tarapacá"),
  (72,"South Korea","Laren","Kujawsko-pomorskie"),
  (73,"New Zealand","Tabuk","Franche-Comté"),
  (74,"Russian Federation","Bruck an der Mur","Junín"),
  (75,"India","Kidapawan","Free State"),
  (76,"China","Cartagena","Innlandet"),
  (77,"China","Gia Nghĩa","Vestfold og Telemark"),
  (78,"Canada","Gorinchem","Antwerpen"),
  (79,"Germany","Mérida","Mpumalanga"),
  (80,"Brazil","Cần Thơ","Antwerpen");
INSERT INTO Centre (id,label,region,district)
VALUES
  (81,"Australia","Wolfville","North Region"),
  (82,"Peru","Xinjiang","Australian Capital Territory"),
  (83,"Chile","Primavera","San Luis Potosí"),
  (84,"Indonesia","Opole","Andalucía"),
  (85,"Pakistan","Galway","Jönköpings län"),
  (86,"China","São José dos Pinhais","Essex"),
  (87,"New Zealand","Tengah","South Gyeongsang"),
  (88,"Turkey","Cork","Caquetá"),
  (89,"Nigeria","Terneuzen","Georgia"),
  (90,"Turkey","Mykolaiv","Alajuela");
INSERT INTO Centre (id,label,region,district)
VALUES
  (91,"Chile","Whangarei","Cundinamarca"),
  (92,"Peru","Lim Chu Kang","Mpumalanga"),
  (93,"Sweden","Wabamun","North Region"),
  (94,"Brazil","Changi Bay","Caraga"),
  (95,"Australia","Santa Rosa de Cabal","Ulster"),
  (96,"Australia","Lower Hutt","Maranhão"),
  (97,"Netherlands","Cork","Puglia"),
  (98,"Pakistan","Bilbo","Kogi"),
  (99,"Canada","Lidingo","Davao Region"),
  (100,"Italy","Waiheke Island","Azad Kashmir");



INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (1,88,7),
  (2,15,5),
  (3,22,4),
  (4,95,5),
  (5,38,9),
  (6,63,5),
  (7,66,8),
  (8,19,6),
  (9,46,4),
  (10,27,7);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (11,52,9),
  (12,73,3),
  (13,18,10),
  (14,66,10),
  (15,11,9),
  (16,90,3),
  (17,74,3),
  (18,28,7),
  (19,87,3),
  (20,52,2);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (21,30,6),
  (22,65,8),
  (23,81,9),
  (24,26,6),
  (25,40,2),
  (26,100,2),
  (27,80,7),
  (28,9,9),
  (29,36,7),
  (30,64,4);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (31,30,3),
  (32,72,9),
  (33,37,8),
  (34,1,2),
  (35,93,3),
  (36,4,9),
  (37,83,2),
  (38,86,9),
  (39,35,1),
  (40,55,2);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (41,58,8),
  (42,97,5),
  (43,48,5),
  (44,11,4),
  (45,68,6),
  (46,85,2),
  (47,60,7),
  (48,7,8),
  (49,38,3),
  (50,97,4);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (51,91,7),
  (52,82,9),
  (53,34,9),
  (54,72,1),
  (55,34,3),
  (56,78,4),
  (57,64,5),
  (58,29,6),
  (59,28,8),
  (60,16,5);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (61,90,7),
  (62,18,6),
  (63,89,9),
  (64,22,3),
  (65,23,2),
  (66,51,9),
  (67,31,3),
  (68,95,1),
  (69,18,9),
  (70,69,2);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (71,9,10),
  (72,44,5),
  (73,80,8),
  (74,13,8),
  (75,42,8),
  (76,43,10),
  (77,23,7),
  (78,21,3),
  (79,18,2),
  (80,65,4);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (81,45,7),
  (82,24,6),
  (83,91,5),
  (84,73,9),
  (85,15,9),
  (86,37,9),
  (87,90,3),
  (88,92,5),
  (89,80,6),
  (90,7,9);
INSERT INTO VaccinCentre (id,idCentre,idVaccin)
VALUES
  (91,81,4),
  (92,16,6),
  (93,52,3),
  (94,8,3),
  (95,1,7),
  (96,60,9),
  (97,20,6),
  (98,20,9),
  (99,34,5),
  (100,68,2);



INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (1,30,5,"2021-11-24"),
  (2,12,8,"2021-03-16"),
  (3,5,3,"2021-06-17"),
  (4,37,9,"2023-02-09"),
  (5,86,2,"2022-01-25"),
  (6,69,9,"2022-03-19"),
  (7,68,4,"2022-09-04"),
  (8,16,4,"2023-01-01"),
  (9,19,5,"2021-10-15"),
  (10,91,2,"2022-02-06");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (11,53,6,"2022-05-10"),
  (12,13,5,"2022-08-25"),
  (13,61,2,"2021-06-20"),
  (14,59,10,"2021-07-07"),
  (15,9,9,"2021-04-18"),
  (16,25,9,"2022-11-10"),
  (17,95,6,"2022-01-23"),
  (18,57,8,"2022-11-07"),
  (19,63,6,"2021-12-27"),
  (20,95,3,"2021-10-07");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (21,43,4,"2022-05-14"),
  (22,97,8,"2022-01-14"),
  (23,57,8,"2021-08-28"),
  (24,33,8,"2021-03-29"),
  (25,66,7,"2022-02-04"),
  (26,22,8,"2021-09-22"),
  (27,74,2,"2022-04-16"),
  (28,77,8,"2021-07-31"),
  (29,28,7,"2021-05-02"),
  (30,58,6,"2022-11-07");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (31,42,5,"2022-06-02"),
  (32,84,3,"2021-11-14"),
  (33,85,9,"2022-10-29"),
  (34,79,4,"2021-08-26"),
  (35,43,4,"2021-10-09"),
  (36,53,7,"2021-06-16"),
  (37,89,8,"2022-11-10"),
  (38,94,1,"2021-06-27"),
  (39,48,3,"2021-03-13"),
  (40,79,4,"2022-01-31");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (41,67,3,"2022-11-04"),
  (42,98,2,"2022-01-20"),
  (43,52,5,"2022-10-09"),
  (44,73,3,"2022-04-16"),
  (45,11,2,"2022-12-01"),
  (46,59,7,"2023-02-20"),
  (47,33,2,"2022-06-26"),
  (48,32,3,"2022-07-20"),
  (49,31,4,"2022-03-09"),
  (50,52,5,"2022-08-07");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (51,95,5,"2021-07-01"),
  (52,57,7,"2022-08-28"),
  (53,62,3,"2022-10-23"),
  (54,8,4,"2023-01-08"),
  (55,1,2,"2021-04-17"),
  (56,50,4,"2021-09-05"),
  (57,17,6,"2022-01-31"),
  (58,13,3,"2022-02-13"),
  (59,15,4,"2021-06-29"),
  (60,53,1,"2022-07-30");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (61,79,10,"2022-01-02"),
  (62,12,5,"2022-09-25"),
  (63,77,9,"2022-06-28"),
  (64,69,3,"2021-06-07"),
  (65,22,6,"2022-01-01"),
  (66,91,3,"2022-03-29"),
  (67,100,6,"2022-11-07"),
  (68,100,1,"2021-10-24"),
  (69,1,8,"2022-12-20"),
  (70,62,7,"2021-04-01");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (71,50,8,"2021-11-18"),
  (72,67,1,"2021-11-10"),
  (73,13,1,"2021-04-05"),
  (74,19,8,"2022-11-16"),
  (75,36,8,"2021-10-12"),
  (76,67,7,"2021-10-15"),
  (77,18,9,"2021-09-22"),
  (78,59,9,"2022-12-07"),
  (79,81,10,"2021-12-11"),
  (80,72,1,"2021-05-18");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (81,85,8,"2021-08-30"),
  (82,22,10,"2021-09-03"),
  (83,33,8,"2022-02-10"),
  (84,22,7,"2022-09-14"),
  (85,84,8,"2023-03-11"),
  (86,13,4,"2022-04-18"),
  (87,94,8,"2022-04-18"),
  (88,90,7,"2021-12-25"),
  (89,99,4,"2021-07-21"),
  (90,44,8,"2021-07-20");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (91,64,5,"2023-02-11"),
  (92,68,8,"2021-09-04"),
  (93,68,9,"2022-05-05"),
  (94,70,4,"2021-12-06"),
  (95,40,4,"2022-07-30"),
  (96,76,2,"2022-02-09"),
  (97,27,6,"2022-08-03"),
  (98,30,4,"2022-05-04"),
  (99,57,1,"2022-04-06"),
  (100,55,5,"2022-04-14");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (101,8,9,"2022-06-25"),
  (102,5,6,"2021-04-26"),
  (103,36,2,"2022-01-20"),
  (104,47,10,"2021-10-30"),
  (105,13,5,"2021-11-27"),
  (106,17,10,"2023-01-09"),
  (107,55,3,"2021-06-18"),
  (108,40,9,"2023-01-10"),
  (109,4,5,"2021-12-26"),
  (110,61,10,"2021-11-29");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (111,88,8,"2021-11-24"),
  (112,90,3,"2022-11-16"),
  (113,95,5,"2022-02-22"),
  (114,96,1,"2022-09-27"),
  (115,82,9,"2022-07-06"),
  (116,69,4,"2022-01-14"),
  (117,89,9,"2022-03-02"),
  (118,75,7,"2021-12-04"),
  (119,36,7,"2022-07-21"),
  (120,17,2,"2021-09-18");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (121,20,5,"2022-12-23"),
  (122,9,8,"2021-09-17"),
  (123,70,5,"2021-07-31"),
  (124,63,7,"2022-09-28"),
  (125,3,4,"2022-04-02"),
  (126,35,6,"2022-06-20"),
  (127,94,6,"2021-06-09"),
  (128,98,4,"2021-08-03"),
  (129,44,7,"2022-02-08"),
  (130,100,3,"2021-07-05");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (131,43,8,"2021-12-22"),
  (132,46,9,"2021-08-15"),
  (133,8,9,"2021-07-18"),
  (134,82,8,"2022-05-28"),
  (135,29,9,"2022-04-30"),
  (136,60,6,"2021-05-12"),
  (137,47,5,"2022-12-16"),
  (138,39,3,"2022-08-14"),
  (139,27,7,"2022-03-14"),
  (140,23,8,"2022-06-12");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (141,77,2,"2023-02-09"),
  (142,50,1,"2022-09-29"),
  (143,30,1,"2022-04-21"),
  (144,63,9,"2022-08-03"),
  (145,8,3,"2021-11-20"),
  (146,22,2,"2021-07-08"),
  (147,60,8,"2021-09-23"),
  (148,41,7,"2023-02-23"),
  (149,2,2,"2023-02-09"),
  (150,34,5,"2021-12-23");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (151,45,5,"2021-07-11"),
  (152,23,6,"2022-01-29"),
  (153,93,5,"2022-10-11"),
  (154,9,7,"2021-10-24"),
  (155,73,4,"2022-01-02"),
  (156,25,8,"2023-01-11"),
  (157,63,9,"2022-01-13"),
  (158,3,10,"2022-10-16"),
  (159,71,3,"2021-07-13"),
  (160,70,9,"2022-03-28");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (161,81,6,"2022-10-08"),
  (162,68,5,"2021-12-25"),
  (163,4,6,"2021-04-15"),
  (164,85,5,"2022-01-31"),
  (165,47,7,"2021-09-21"),
  (166,61,4,"2021-10-22"),
  (167,63,1,"2021-09-13"),
  (168,51,6,"2021-06-11"),
  (169,46,6,"2022-04-19"),
  (170,87,3,"2022-12-19");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (171,4,7,"2022-08-17"),
  (172,28,4,"2023-03-02"),
  (173,26,5,"2021-11-09"),
  (174,91,8,"2023-02-09"),
  (175,80,4,"2022-09-24"),
  (176,70,6,"2021-12-22"),
  (177,45,2,"2021-11-30"),
  (178,70,9,"2022-10-21"),
  (179,63,6,"2021-07-23"),
  (180,28,2,"2022-11-02");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (181,32,8,"2021-04-09"),
  (182,82,6,"2023-01-17"),
  (183,51,7,"2022-11-29"),
  (184,40,10,"2022-06-26"),
  (185,89,6,"2021-11-12"),
  (186,22,5,"2022-12-26"),
  (187,23,4,"2022-10-13"),
  (188,83,6,"2021-12-07"),
  (189,38,6,"2021-12-17"),
  (190,52,8,"2021-09-28");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (191,4,1,"2021-09-30"),
  (192,27,3,"2022-12-01"),
  (193,9,2,"2021-12-03"),
  (194,64,1,"2021-08-26"),
  (195,66,6,"2023-01-24"),
  (196,56,5,"2022-06-28"),
  (197,90,6,"2021-05-07"),
  (198,25,2,"2021-04-12"),
  (199,2,9,"2021-10-22"),
  (200,33,2,"2021-04-21");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (201,30,7,"2022-11-08"),
  (202,40,2,"2022-06-13"),
  (203,93,4,"2022-12-09"),
  (204,30,2,"2021-08-04"),
  (205,68,9,"2021-11-07"),
  (206,94,4,"2022-05-29"),
  (207,96,4,"2022-07-05"),
  (208,37,3,"2021-12-16"),
  (209,59,8,"2021-05-17"),
  (210,15,4,"2022-06-03");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (211,69,10,"2021-04-02"),
  (212,3,1,"2021-07-14"),
  (213,17,8,"2021-11-23"),
  (214,71,2,"2022-11-21"),
  (215,66,4,"2022-01-13"),
  (216,30,3,"2023-01-23"),
  (217,78,10,"2022-10-01"),
  (218,26,8,"2021-08-23"),
  (219,52,9,"2021-12-15"),
  (220,77,5,"2021-07-11");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (221,57,10,"2023-03-09"),
  (222,65,2,"2021-03-28"),
  (223,5,3,"2021-09-09"),
  (224,80,3,"2021-04-24"),
  (225,89,6,"2022-09-18"),
  (226,10,3,"2021-08-02"),
  (227,33,3,"2021-09-14"),
  (228,77,7,"2021-11-15"),
  (229,62,5,"2022-05-01"),
  (230,17,3,"2022-06-27");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (231,61,4,"2022-07-29"),
  (232,66,2,"2022-01-08"),
  (233,71,8,"2022-07-16"),
  (234,5,9,"2021-11-20"),
  (235,67,4,"2021-05-29"),
  (236,69,2,"2022-01-02"),
  (237,29,7,"2021-10-12"),
  (238,70,5,"2021-12-23"),
  (239,11,7,"2021-11-06"),
  (240,33,5,"2022-10-25");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (241,45,6,"2022-11-05"),
  (242,32,5,"2021-06-15"),
  (243,11,6,"2022-12-11"),
  (244,35,6,"2022-04-29"),
  (245,75,2,"2022-11-10"),
  (246,89,5,"2021-10-12"),
  (247,97,7,"2022-03-13"),
  (248,44,2,"2021-07-27"),
  (249,27,3,"2022-07-20"),
  (250,92,3,"2021-08-14");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (251,81,5,"2022-02-01"),
  (252,98,2,"2022-05-20"),
  (253,69,7,"2022-06-28"),
  (254,35,5,"2022-05-19"),
  (255,36,3,"2022-10-30"),
  (256,94,8,"2022-11-29"),
  (257,65,9,"2022-09-19"),
  (258,89,8,"2021-07-27"),
  (259,78,9,"2022-02-09"),
  (260,22,4,"2022-12-07");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (261,60,3,"2022-01-24"),
  (262,95,8,"2021-09-07"),
  (263,32,7,"2021-09-03"),
  (264,66,7,"2022-01-11"),
  (265,73,6,"2022-08-08"),
  (266,15,4,"2021-12-18"),
  (267,92,8,"2022-05-10"),
  (268,3,7,"2021-09-07"),
  (269,77,8,"2022-08-09"),
  (270,27,9,"2022-05-13");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (271,72,1,"2022-01-29"),
  (272,23,5,"2021-10-07"),
  (273,33,9,"2021-10-18"),
  (274,54,10,"2022-02-18"),
  (275,65,5,"2021-06-26"),
  (276,25,6,"2022-02-11"),
  (277,58,7,"2023-02-26"),
  (278,71,8,"2022-12-08"),
  (279,50,5,"2021-05-26"),
  (280,51,7,"2022-02-01");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (281,16,2,"2021-04-27"),
  (282,95,6,"2022-07-19"),
  (283,13,3,"2022-11-18"),
  (284,27,10,"2022-09-13"),
  (285,82,8,"2021-05-18"),
  (286,46,10,"2022-07-18"),
  (287,84,2,"2021-11-28"),
  (288,27,7,"2022-09-12"),
  (289,47,2,"2021-08-06"),
  (290,15,4,"2021-12-17");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (291,53,6,"2021-06-20"),
  (292,83,7,"2022-08-31"),
  (293,73,5,"2022-02-12"),
  (294,38,8,"2021-10-10"),
  (295,44,7,"2023-03-08"),
  (296,59,3,"2022-01-04"),
  (297,28,7,"2022-09-10"),
  (298,83,8,"2021-08-05"),
  (299,13,5,"2022-06-21"),
  (300,12,9,"2021-11-02");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (301,25,5,"2022-11-21"),
  (302,26,4,"2021-10-02"),
  (303,40,3,"2022-10-02"),
  (304,50,8,"2021-06-28"),
  (305,55,1,"2021-09-14"),
  (306,89,3,"2022-09-23"),
  (307,59,7,"2022-02-07"),
  (308,79,7,"2023-03-04"),
  (309,89,9,"2022-05-16"),
  (310,100,8,"2021-04-02");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (311,88,2,"2021-07-25"),
  (312,25,6,"2022-07-20"),
  (313,90,6,"2022-11-24"),
  (314,63,4,"2022-02-17"),
  (315,95,2,"2022-10-17"),
  (316,69,6,"2021-08-23"),
  (317,26,2,"2022-03-06"),
  (318,40,6,"2023-01-28"),
  (319,8,2,"2021-09-16"),
  (320,78,8,"2022-08-01");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (321,37,5,"2021-12-19"),
  (322,12,3,"2021-12-21"),
  (323,59,2,"2022-03-25"),
  (324,59,3,"2023-02-23"),
  (325,22,2,"2021-08-10"),
  (326,9,5,"2022-07-18"),
  (327,97,8,"2022-04-30"),
  (328,65,2,"2022-09-19"),
  (329,38,7,"2021-05-09"),
  (330,46,4,"2021-04-18");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (331,23,8,"2022-06-29"),
  (332,90,4,"2022-12-08"),
  (333,75,9,"2023-03-11"),
  (334,36,1,"2022-01-27"),
  (335,62,4,"2022-08-22"),
  (336,17,5,"2021-04-03"),
  (337,84,10,"2022-04-26"),
  (338,34,6,"2022-04-02"),
  (339,99,7,"2021-05-14"),
  (340,51,9,"2021-06-28");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (341,5,2,"2022-11-28"),
  (342,43,9,"2021-10-04"),
  (343,13,5,"2022-04-27"),
  (344,68,4,"2021-10-08"),
  (345,61,4,"2021-09-03"),
  (346,86,4,"2023-02-04"),
  (347,17,4,"2022-05-18"),
  (348,55,7,"2021-10-28"),
  (349,57,8,"2022-02-16"),
  (350,3,3,"2022-11-23");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (351,53,8,"2022-12-11"),
  (352,11,9,"2022-01-22"),
  (353,50,1,"2021-06-01"),
  (354,20,5,"2022-11-26"),
  (355,91,1,"2021-12-18"),
  (356,90,4,"2021-10-25"),
  (357,10,9,"2021-08-19"),
  (358,73,10,"2023-01-07"),
  (359,62,10,"2021-11-30"),
  (360,51,3,"2021-12-20");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (361,88,3,"2022-06-12"),
  (362,49,9,"2022-10-10"),
  (363,88,4,"2021-12-04"),
  (364,35,9,"2021-11-22"),
  (365,38,9,"2022-11-28"),
  (366,19,7,"2021-07-26"),
  (367,63,5,"2022-06-20"),
  (368,81,7,"2021-05-02"),
  (369,59,4,"2021-12-01"),
  (370,50,10,"2022-07-01");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (371,7,7,"2022-03-12"),
  (372,31,8,"2023-01-19"),
  (373,94,7,"2021-10-26"),
  (374,87,7,"2022-08-03"),
  (375,35,9,"2023-02-06"),
  (376,72,6,"2021-10-27"),
  (377,20,1,"2022-04-29"),
  (378,26,2,"2021-03-14"),
  (379,29,3,"2022-06-17"),
  (380,7,4,"2021-06-20");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (381,24,2,"2022-01-21"),
  (382,29,3,"2021-06-01"),
  (383,17,8,"2021-07-12"),
  (384,11,5,"2022-02-12"),
  (385,25,10,"2022-05-26"),
  (386,89,5,"2021-04-12"),
  (387,93,3,"2021-10-27"),
  (388,86,8,"2022-04-19"),
  (389,36,6,"2021-07-02"),
  (390,73,4,"2021-05-14");
INSERT INTO Reservation (id,idCentre,idVaccin,date)
VALUES
  (391,96,10,"2022-11-28"),
  (392,32,2,"2022-03-23"),
  (393,74,7,"2021-06-08"),
  (394,49,9,"2021-06-04"),
  (395,21,8,"2023-02-15"),
  (396,61,3,"2021-12-14"),
  (397,56,6,"2021-07-25"),
  (398,26,4,"2023-03-09"),
  (399,16,8,"2022-07-17"),
  (400,53,4,"2022-06-17");


INSERT INTO resultat (id,idInfecte,date,resultat)
VALUES
  (1,19,"1994-12-23","mort"),
  (2,43,"1998-04-22","gueris"),
  (3,61,"1995-11-13","forme grave"),
  (4,94,"2000-01-28","forme grave"),
  (5,98,"1997-06-14","mort"),
  (6,51,"2000-09-08","gueris"),
  (7,48,"1996-04-16","forme grave"),
  (8,70,"1997-09-15","forme grave"),
  (9,95,"1997-01-19","forme grave"),
  (10,77,"1996-10-09","gueris");
INSERT INTO resultat (id,idInfecte,date,resultat)
VALUES
  (11,92,"2000-08-25","forme grave"),
  (12,41,"1998-03-04","gueris"),
  (13,31,"1997-11-05","mort"),
  (14,61,"1995-03-10","gueris"),
  (15,90,"1999-11-10","gueris"),
  (16,23,"1996-10-22","gueris"),
  (17,83,"1995-07-26","forme grave"),
  (18,12,"1996-01-13","gueris"),
  (19,79,"1999-03-14","mort"),
  (20,68,"1995-09-14","forme grave");
INSERT INTO resultat (id,idInfecte,date,resultat)
VALUES
  (21,22,"1995-11-16","gueris"),
  (22,53,"1995-05-27","gueris"),
  (23,27,"1994-11-20","gueris"),
  (24,53,"1998-01-14","forme grave"),
  (25,38,"1999-07-09","forme grave"),
  (26,37,"1997-08-03","mort"),
  (27,68,"2000-03-17","mort"),
  (28,24,"1994-05-03","forme grave"),
  (29,78,"1996-01-08","gueris"),
  (30,44,"2000-11-13","forme grave");
INSERT INTO resultat (id,idInfecte,date,resultat)
VALUES
  (31,69,"1997-08-20","forme grave"),
  (32,68,"1995-12-09","mort"),
  (33,79,"1997-08-20","mort"),
  (34,77,"1994-04-17","gueris"),
  (35,14,"1997-01-24","gueris"),
  (36,71,"1994-07-17","forme grave"),
  (37,23,"1997-07-25","forme grave"),
  (38,74,"1999-10-29","mort"),
  (39,88,"1996-12-05","forme grave"),
  (40,100,"1996-07-09","mort");
INSERT INTO resultat (id,idInfecte,date,resultat)
VALUES
  (41,30,"2000-10-04","mort"),
  (42,88,"1999-09-23","mort"),
  (43,34,"1998-10-02","mort"),
  (44,21,"1996-08-16","forme grave"),
  (45,37,"1996-12-20","gueris"),
  (46,34,"1997-10-28","gueris"),
  (47,27,"1997-03-13","forme grave"),
  (48,26,"1994-09-17","mort"),
  (49,95,"2000-08-31","forme grave"),
  (50,11,"1997-05-15","mort");




INSERT INTO resultatVaccination (id,idVaccination,date,resultat)
VALUES
  (1,126,"1998-10-19","forme grave"),
  (2,142,"1998-08-05","forme grave"),
  (3,18,"1998-05-29","gueris"),
  (4,246,"1994-08-07","gueris"),
  (5,252,"1994-11-19","forme grave"),
  (6,164,"1998-09-24","forme grave"),
  (7,221,"1996-09-14","gueris"),
  (8,293,"1997-04-15","gueris"),
  (9,235,"2000-11-11","mort"),
  (10,21,"2000-11-30","mort");
INSERT INTO resultatVaccination (id,idVaccination,date,resultat)
VALUES
  (11,211,"1996-03-13","forme grave"),
  (12,9,"2000-09-09","gueris"),
  (13,286,"2001-01-28","gueris"),
  (14,63,"1999-05-31","forme grave"),
  (15,10,"1994-10-15","gueris"),
  (16,80,"2000-06-18","forme grave"),
  (17,87,"1994-07-29","mort"),
  (18,208,"1995-02-20","gueris"),
  (19,52,"1998-05-09","gueris"),
  (20,238,"1999-08-27","mort");
INSERT INTO resultatVaccination (id,idVaccination,date,resultat)
VALUES
  (21,128,"1997-09-23","mort"),
  (22,160,"1999-02-09","mort"),
  (23,161,"1995-08-03","forme grave"),
  (24,92,"1995-06-15","gueris"),
  (25,118,"2001-01-28","mort"),
  (26,84,"1997-04-08","forme grave"),
  (27,169,"1995-11-17","mort"),
  (28,97,"1995-04-13","forme grave"),
  (29,204,"2000-11-02","gueris"),
  (30,68,"1994-10-28","mort");
INSERT INTO resultatVaccination (id,idVaccination,date,resultat)
VALUES
  (31,45,"1995-09-30","gueris"),
  (32,194,"1994-03-29","mort"),
  (33,179,"2000-02-12","gueris"),
  (34,225,"1994-08-28","mort"),
  (35,118,"1998-02-04","mort"),
  (36,247,"1995-05-20","forme grave"),
  (37,178,"1994-05-23","mort"),
  (38,261,"1996-05-08","forme grave"),
  (39,74,"1996-05-12","gueris"),
  (40,209,"1996-06-11","gueris");
INSERT INTO resultatVaccination (id,idVaccination,date,resultat)
VALUES
  (41,204,"1997-11-23","gueris"),
  (42,277,"1994-08-07","mort"),
  (43,102,"1999-11-12","forme grave"),
  (44,32,"2000-10-23","gueris"),
  (45,288,"1994-06-16","forme grave"),
  (46,175,"1994-12-24","forme grave"),
  (47,177,"2000-12-04","mort"),
  (48,37,"1995-07-17","mort"),
  (49,258,"1998-03-30","forme grave"),
  (50,144,"1998-10-06","gueris");


INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (1,46,"2000-01-18",8),
  (2,46,"1999-02-22",9),
  (3,42,"1997-07-07",5),
  (4,42,"1995-07-04",6),
  (5,46,"1999-04-30",9),
  (6,38,"1996-08-28",8),
  (7,24,"1995-03-03",5),
  (8,35,"2000-06-06",9),
  (9,48,"1995-02-27",8),
  (10,34,"1998-09-07",6);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (11,34,"1998-07-17",10),
  (12,22,"1997-07-07",8),
  (13,29,"1999-03-09",9),
  (14,30,"1999-06-08",5),
  (15,37,"1994-05-22",3),
  (16,50,"1999-09-20",9),
  (17,6,"2000-01-10",3),
  (18,43,"1997-01-18",6),
  (19,40,"1998-10-07",4),
  (20,43,"2000-02-11",8);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (21,13,"2000-04-24",1),
  (22,41,"1997-04-09",9),
  (23,33,"1996-06-28",6),
  (24,34,"1999-10-25",9),
  (25,10,"1999-10-10",7),
  (26,41,"1997-04-27",9),
  (27,9,"1995-12-14",9),
  (28,26,"1995-04-30",3),
  (29,10,"1994-03-25",8),
  (30,42,"1994-12-14",5);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (31,27,"1995-11-02",5),
  (32,49,"1997-01-08",2),
  (33,6,"2000-08-14",8),
  (34,12,"1997-10-16",4),
  (35,15,"1994-09-24",7),
  (36,33,"1997-04-27",7),
  (37,45,"1996-11-12",9),
  (38,14,"1997-06-03",7),
  (39,50,"1995-08-03",4),
  (40,49,"2000-12-16",3);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (41,17,"1998-08-05",2),
  (42,24,"2000-04-17",3),
  (43,23,"1998-12-23",2),
  (44,5,"1995-05-23",9),
  (45,38,"1998-03-24",8),
  (46,29,"1999-11-19",5),
  (47,15,"1998-10-06",2),
  (48,41,"1995-07-15",9),
  (49,27,"1999-06-24",10),
  (50,6,"1997-11-21",8);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (51,49,"2000-12-01",6),
  (52,32,"1996-12-03",2),
  (53,37,"1994-12-24",4),
  (54,33,"1999-05-28",10),
  (55,33,"1995-07-11",8),
  (56,18,"2000-11-12",4),
  (57,49,"1996-06-30",3),
  (58,10,"1998-08-31",8),
  (59,11,"2000-09-28",4),
  (60,30,"1998-01-11",9);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (61,46,"1995-10-31",5),
  (62,32,"1995-09-27",6),
  (63,37,"1999-03-24",6),
  (64,15,"1999-03-31",2),
  (65,7,"1997-01-29",10),
  (66,30,"1994-12-25",6),
  (67,2,"1994-06-30",4),
  (68,34,"1998-12-04",2),
  (69,36,"1995-07-15",3),
  (70,12,"1999-05-02",3);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (71,34,"1996-02-15",3),
  (72,28,"1994-11-03",5),
  (73,34,"1996-01-18",7),
  (74,33,"1998-04-10",9),
  (75,6,"1995-08-05",4),
  (76,25,"1999-11-12",8),
  (77,50,"1999-10-03",6),
  (78,33,"1998-03-15",2),
  (79,25,"1999-02-08",7),
  (80,12,"1998-07-18",2);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (81,37,"2000-06-03",7),
  (82,27,"1994-04-01",6),
  (83,3,"1996-10-30",5),
  (84,21,"1995-08-05",9),
  (85,12,"2000-03-27",6),
  (86,15,"1997-12-01",9),
  (87,28,"1999-05-15",6),
  (88,42,"1998-08-26",8),
  (89,36,"1997-04-01",9),
  (90,21,"1996-07-16",2);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (91,8,"1999-07-10",5),
  (92,16,"1996-03-25",2),
  (93,4,"2000-11-25",3),
  (94,22,"1999-09-19",5),
  (95,46,"1997-09-17",6),
  (96,7,"1994-07-27",3),
  (97,6,"2001-03-08",2),
  (98,9,"1994-04-04",7),
  (99,20,"1998-05-22",5),
  (100,10,"2001-01-08",6);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (101,6,"1996-01-29",9),
  (102,19,"1994-04-06",4),
  (103,17,"1998-09-21",6),
  (104,33,"1999-02-20",4),
  (105,19,"2001-02-27",6),
  (106,25,"1996-12-22",10),
  (107,47,"2000-10-19",2),
  (108,33,"1999-01-14",5),
  (109,11,"1997-10-23",8),
  (110,20,"2000-01-03",2);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (111,26,"1994-08-26",1),
  (112,41,"1999-10-23",4),
  (113,49,"1998-02-08",5),
  (114,45,"1994-04-07",3),
  (115,13,"1994-11-05",5),
  (116,41,"1996-07-24",7),
  (117,10,"1995-01-28",4),
  (118,27,"1999-08-20",5),
  (119,19,"1999-10-11",9),
  (120,33,"1998-11-13",4);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (121,46,"2000-02-04",10),
  (122,47,"1997-01-26",7),
  (123,17,"1996-06-17",8),
  (124,49,"1997-09-28",7),
  (125,46,"2000-11-14",3),
  (126,11,"1999-11-28",9),
  (127,41,"1996-12-27",3),
  (128,33,"1997-10-04",9),
  (129,3,"1997-03-12",6),
  (130,29,"1994-08-14",2);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (131,36,"1996-07-19",5),
  (132,39,"1996-10-29",7),
  (133,19,"1997-01-18",9),
  (134,38,"1999-03-29",1),
  (135,13,"2000-07-05",8),
  (136,9,"1996-08-09",7),
  (137,47,"1998-08-31",6),
  (138,8,"2000-09-01",7),
  (139,18,"1995-05-10",1),
  (140,31,"1996-01-27",6);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (141,5,"1994-05-19",3),
  (142,37,"2000-11-27",5),
  (143,6,"1995-02-19",6),
  (144,20,"2000-04-02",7),
  (145,19,"1999-11-20",4),
  (146,10,"1997-08-17",9),
  (147,8,"1996-05-15",7),
  (148,33,"1994-09-02",6),
  (149,19,"1999-07-26",5),
  (150,21,"1997-05-19",8);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (151,7,"1999-08-13",2),
  (152,8,"1998-05-19",5),
  (153,35,"1997-05-13",6),
  (154,26,"1995-12-05",10),
  (155,21,"1997-02-28",4),
  (156,1,"1999-02-15",7),
  (157,3,"2000-10-15",2),
  (158,23,"1998-10-25",7),
  (159,37,"1998-06-28",5),
  (160,27,"1995-07-11",7);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (161,15,"2000-01-05",10),
  (162,4,"1998-01-17",2),
  (163,29,"1996-11-28",3),
  (164,30,"2001-03-03",7),
  (165,25,"1996-08-09",6),
  (166,44,"1997-03-24",4),
  (167,38,"1995-01-27",4),
  (168,30,"1998-03-23",5),
  (169,48,"1997-05-06",5),
  (170,8,"2001-01-22",5);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (171,16,"2000-02-03",5),
  (172,18,"2000-10-15",3),
  (173,10,"1999-09-23",3),
  (174,9,"1999-12-24",8),
  (175,34,"2000-06-12",4),
  (176,13,"1997-05-17",5),
  (177,38,"1998-01-13",7),
  (178,34,"1997-01-26",2),
  (179,45,"1997-06-26",8),
  (180,44,"1998-11-23",8);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (181,48,"1994-07-27",6),
  (182,29,"2000-05-28",7),
  (183,23,"1995-01-27",2),
  (184,43,"2000-09-25",5),
  (185,15,"1995-06-07",8),
  (186,13,"1995-05-20",10),
  (187,24,"1997-07-05",5),
  (188,49,"1995-04-11",5),
  (189,39,"1999-02-20",9),
  (190,18,"1996-04-08",6);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (191,25,"2000-03-12",8),
  (192,8,"1995-05-05",7),
  (193,48,"1997-12-18",8),
  (194,41,"2000-02-11",5),
  (195,32,"1997-04-01",10),
  (196,9,"1994-10-28",1),
  (197,40,"1997-11-18",3),
  (198,46,"2000-09-22",9),
  (199,44,"1997-03-12",6),
  (200,2,"1999-03-20",8);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (201,28,"1999-11-22",2),
  (202,44,"2000-11-01",7),
  (203,33,"2000-10-15",4),
  (204,17,"2000-08-24",3),
  (205,37,"1997-06-15",3),
  (206,14,"1999-02-07",7),
  (207,36,"1995-03-02",4),
  (208,10,"1999-11-16",2),
  (209,27,"1997-07-24",6),
  (210,23,"1999-12-12",4);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (211,16,"1999-02-26",6),
  (212,23,"1997-01-23",4),
  (213,45,"1998-02-20",6),
  (214,41,"2001-02-03",3),
  (215,20,"2001-01-29",3),
  (216,36,"1996-06-29",5),
  (217,38,"2000-10-05",5),
  (218,13,"1996-12-19",3),
  (219,39,"1997-01-14",8),
  (220,36,"2000-01-17",1);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (221,15,"1996-01-22",6),
  (222,14,"1998-01-21",1),
  (223,8,"1996-12-09",4),
  (224,4,"2000-08-09",9),
  (225,30,"1997-10-30",6),
  (226,4,"2000-09-05",6),
  (227,32,"1998-06-07",9),
  (228,12,"1999-12-16",6),
  (229,9,"1994-04-26",10),
  (230,41,"1997-11-27",9);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (231,21,"1996-05-11",4),
  (232,2,"1999-06-04",10),
  (233,4,"1996-01-18",8),
  (234,38,"1998-07-18",8),
  (235,34,"1994-12-01",3),
  (236,3,"1998-10-03",4),
  (237,21,"1998-07-19",9),
  (238,33,"1996-08-02",8),
  (239,2,"1995-05-16",7),
  (240,17,"2000-08-18",7);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (241,34,"1998-06-13",10),
  (242,20,"1997-01-03",8),
  (243,8,"1999-08-06",7),
  (244,39,"1998-06-11",3),
  (245,11,"1999-08-04",6),
  (246,24,"2000-03-11",6),
  (247,1,"2001-02-02",9),
  (248,46,"1995-04-06",4),
  (249,12,"1994-10-21",4),
  (250,37,"1999-08-14",5);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (251,23,"1995-01-04",9),
  (252,4,"1995-12-03",2),
  (253,31,"1996-01-10",8),
  (254,13,"1996-12-15",8),
  (255,25,"1995-03-16",9),
  (256,18,"1996-12-10",9),
  (257,48,"1999-07-31",6),
  (258,2,"2000-03-26",2),
  (259,20,"1999-05-14",7),
  (260,49,"1997-08-03",1);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (261,22,"1996-03-14",9),
  (262,17,"2000-11-25",3),
  (263,43,"2000-11-20",7),
  (264,5,"2000-10-28",4),
  (265,26,"1996-09-01",5),
  (266,14,"1997-09-15",9),
  (267,31,"1997-10-28",4),
  (268,2,"1995-04-30",1),
  (269,2,"1996-02-16",8),
  (270,24,"1998-06-27",9);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (271,19,"1995-12-05",3),
  (272,39,"1999-05-23",7),
  (273,32,"2000-11-30",3),
  (274,24,"1997-01-19",4),
  (275,46,"1999-03-18",1),
  (276,1,"1998-01-13",8),
  (277,20,"1996-05-14",4),
  (278,43,"1996-06-29",4),
  (279,35,"1996-09-09",2),
  (280,32,"2000-11-01",2);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (281,8,"1995-07-29",1),
  (282,40,"1999-08-09",9),
  (283,45,"1994-10-23",1),
  (284,41,"1999-05-29",4),
  (285,10,"1999-01-11",9),
  (286,24,"1999-12-20",3),
  (287,32,"1997-12-23",7),
  (288,3,"1996-05-24",3),
  (289,48,"2001-01-22",2),
  (290,30,"1994-12-11",9);
INSERT INTO vaccination (id,idPersonne,date,idVaccin)
VALUES
  (291,31,"1995-09-23",9),
  (292,12,"1994-07-22",2),
  (293,34,"1998-02-18",2),
  (294,33,"1999-04-22",6),
  (295,32,"1995-08-14",8),
  (296,46,"1998-07-16",4),
  (297,35,"2001-03-11",3),
  (298,17,"2000-03-06",5),
  (299,21,"1996-07-23",5),
  (300,44,"1995-05-29",6);
