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

