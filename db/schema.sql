CREATE TABLE athletes(
  id int,
  name varchar(50),
  identified_gender varchar(1),
  dob date
  PRIMARY KEY(id)
)

CREATE TABLE schema_migrations (
 migration varchar(255),
 migrated_at time,
 PRIMARY KEY (migration)
); 

ALTER TABLE athletes
RENAME COLUMN identified_gender TO gender;

INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20200206230001-update-athletes.sql', '2020-01-27 18:30:00'); 
