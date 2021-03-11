Lab 6:

**Query #1**

    SELECT name, birthplace
    FROM artists;

| name         | birthplace    |
| ------------ | ------------- |
| Leonardo     | Florence      |
| Michelangelo | Arezzo        |
| Josefa       | Seville       |
| Hans Hofmann | Weisenburg    |
| John         | San Francisco |
| Caravaggio   | Milan         |
| Picasso      | Malaga        |

---

**Query #2**

    SELECT title, price
        FROM artworks
        WHERE year > 1600;

| title           | price    |
| --------------- | -------- |
| Three Musicians | 11000.00 |

---

**Query #3**

    SELECT title, type
        FROM artworks
        WHERE year = 2000 OR artist_name = 'Picasso';

| title           | type   |
| --------------- | ------ |
| Three Musicians | Modern |

---

**Query #4**

    SELECT name, birthplace
        FROM artists
        WHERE EXTRACT(YEAR FROM dateofbirth) BETWEEN 1880 AND 1930;

| name    | birthplace    |
| ------- | ------------- |
| John    | San Francisco |
| Picasso | Malaga        |

---

**Query #5**

    SELECT name, country
        FROM artists
        WHERE style IN ('Modern', 'Baroque', 'Renaissance');

| name         | country |
| ------------ | ------- |
| Leonardo     | Italy   |
| Michelangelo | Italy   |
| Josefa       | Spain   |
| Hans Hofmann | Germany |
| John         | USA     |
| Caravaggio   | Italy   |

---

**Schema (PostgreSQL v13)**

    CREATE TABLE artists (
     name VARCHAR(20),
     birthplace VARCHAR(20),
     style VARCHAR(20),
     dateofbirth DATE,
     PRIMARY KEY (name)
    );
    CREATE TABLE customers (
     id INTEGER,
     name VARCHAR(20),
     address VARCHAR(20),
     amount numeric(8,2),
     PRIMARY KEY (id)
    );
    CREATE TABLE artworks (
     title VARCHAR(20),
     year INTEGER,
     type VARCHAR(20),
     price numeric(8,2),
     artist_name VARCHAR(20),
     PRIMARY KEY (title),
     FOREIGN KEY(artist_name) REFERENCES artists(name)
    );
    CREATE TABLE likeartists (
     customer_id INTEGER,
     artist_name VARCHAR(20),
     PRIMARY KEY(artist_name, customer_id),
     FOREIGN KEY (artist_name) REFERENCES artists(name),
     FOREIGN KEY (customer_id) REFERENCES customers(id)
    );
    
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
    

---

**Query #6**

    SELECT *
        FROM artworks
        ORDER BY title;

| title           | year | type    | price    | artist_name |
| --------------- | ---- | ------- | -------- | ----------- |
| The Cardsharps  | 1594 | Baroque | 40000.00 | Caravaggio  |
| Three Musicians | 1921 | Modern  | 11000.00 | Picasso     |

---

**Query #7**

    SELECT customers.name, customers.id
    FROM likeartists
    INNER JOIN customers ON likeartists.customer_id = customers.id
    WHERE likeartists.artist_name = 'Picasso';

| name  | id  |
| ----- | --- |
| Emre  | 4   |
| Saeid | 5   |

---

