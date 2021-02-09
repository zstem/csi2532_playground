Voici mon soumission pour lab 4.

https://docs.google.com/document/d/1tV5idr9Nq2uBuNRimc3KxvxyH3QTwRxQqoDTKcMWzAg/edit?usp=sharing

1. 

```sql
CREATE TABLE professors(
	ssn int,
  nom varchar(50),
	PRIMARY KEY (ssn)
);

CREATE TABLE courses(
	courseid int,
  nom varchar(50),
	PRIMARY KEY (courseid)
);

CREATE TABLE teaches(
	ssn int,
	courseid int,
	semesterid int,
	FOREIGN KEY (ssn) REFERENCES professors(ssn),
	FOREIGN KEY (courseid) REFERENCES courses(courseid)
);

```
2. 

```sql
CREATE TABLE professors(
	ssn int,
  nom varchar(50),
	PRIMARY KEY (ssn)
);

CREATE TABLE courses(
	courseid int,
  nom varchar(50),
	PRIMARY KEY (courseid)
);

CREATE TABLE teaches(
	ssn int,
	courseid int,
	FOREIGN KEY (ssn) REFERENCES professors(ssn),
	FOREIGN KEY (courseid) REFERENCES courses(courseid)
);
```
3. 

```sql
CREATE TABLE professors(
	ssn int,
  nom varchar(50),
	PRIMARY KEY (ssn)
);

CREATE TABLE courses(
	courseid int,
  nom varchar(50),
  semesterid int,
	PRIMARY KEY (courseid)
);

CREATE TABLE teaches(
	ssn int,
	courseid int,
	semesterid int,
	FOREIGN KEY (ssn) REFERENCES professors(ssn),
	FOREIGN KEY (courseid) REFERENCES courses(courseid),
  FOREIGN KEY (semesterid) REFERENCES courses(semesterid)
);

```
4. 

```sql
CREATE TABLE professors(
	ssn int,
  nom varchar(50),
  teachingteamid int,
  FOREIGN KEY (teachingteamid) REFERENCES teachingteam(id)
	PRIMARY KEY (ssn)
);

CREATE TABLE courses(
	courseid int,
  nom varchar(50),
	PRIMARY KEY (courseid)
);

CREATE TABLE teaches(
	ssn int,
	courseid int,
  teachingteamid int,
	FOREIGN KEY (ssn) REFERENCES professors(ssn),
	FOREIGN KEY (courseid) REFERENCES courses(courseid)
  FOREIGN KEY (teachingteamid) REFERENCES professors(teachingteamid)
);
CREATE TABLE teachingteam(
	id int,
  PRIMARY KEY (id)
);
```
