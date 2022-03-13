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

CREATE TABLE ContreIndication(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idVaccin INTEGER,
    idMaladieChronique INTEGER
);


CREATE TABLE MaladieChronique(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50)
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

