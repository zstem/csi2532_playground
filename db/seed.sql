INSERT INTO customers
(id, name, address, amount)
VALUES
(1, 'John', 'Ottawa', 8.5),
(2, 'Amy', 'Orleans', 9.0),
(3, 'Peter', 'Gatineau', 6.3);

INSERT INTO artists
(name, birthplace, style, dateofbirth)
VALUES
('Caravaggio', 'Milan', 'Baroque', '1571-09-28' ),
('Smith', 'Ottawa', 'Modern', '1977-12-12'),
('Picasso', 'Malaga', 'Cubism', '1881-10-25');

INSERT INTO artworks
(title, year, type, price, artist_name)
VALUES
('Blue', 2000, 'Modern', 10000.00, 'Smith'),
('The Cardsharps', 1594, 'Baroque', 40000.00, 'Caravaggio');

UPDATE customers
SET amount = 9.8
WHERE address = 'Gatineau';

DELETE
FROM customers
WHERE name = 'John';


ALTER TABLE artists
ADD COLUMN country varchar(100);

ALTER TABLE customers
ADD COLUMN rating integer CHECK (rating between 1 and 10);

INSERT INTO customers
(id, name, address, amount, rating)
VALUES
(4, 'Emre', 'Preston', 20000.00, 5),
(5, 'Saeid', null, 40000.00, 6);

INSERT INTO artists
(name, birthplace, style, dateofbirth, country)
VALUES
('Leonardo', 'Florence', 'Renaissance', '04-15-1452', 'Italy'),
('Michelangelo', 'Arezzo', 'Renaissance', '03-06-1475',
'Italy'),
('Josefa', 'Seville', 'Baroque', '09-09-1630', 'Spain'),
('Hans Hofmann', 'Weisenburg', 'Modern', '02-17-1966', 'Germany'),
('John', 'San Francisco', 'Modern', '02-17-1920', 'USA');

INSERT INTO artworks
(title, year, type, price, artist_name)
VALUES
('Waves', 2000, null, 4000.00, 'Smith'),
('Three Musicians', 1921, 'Modern', 11000.00, 'Picasso');

INSERT INTO likeartists
(customer_id, artist_name)
VALUES
(4, 'Picasso'),
(5, 'Picasso'),
(5, 'Leonardo');

DELETE
FROM artworks
WHERE artist_name = 'Smith';

DELETE
FROM artists
WHERE name = 'Smith';

BEGIN;
ALTER TABLE artworks
DROP CONSTRAINT artworks_artist_name_fkey;
ALTER TABLE artworks
ADD CONSTRAINT artworks_artist_name_fkey
FOREIGN KEY (artist_name) REFERENCES artists(name)
ON DELETE CASCADE
ON UPDATE CASCADE;
COMMIT;

UPDATE artists
SET country = 'Italy' WHERE birthplace = 'Milan';
UPDATE artists
SET country = 'Spain' WHERE birthplace = 'Malaga';
