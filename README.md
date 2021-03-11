Lab 6:

---

**Query #1**

    SELECT name, birthplace
    FROM artists;

| name       | birthplace |
| ---------- | ---------- |
| Caravaggio | Milan      |
| Picasso    | Malaga     |

---

**Query #2**

    SELECT title, price
    FROM artworks
    WHERE year > 1600;

There are no results to be displayed.

---

**Query #3**

    SELECT title, type
    FROM artworks
    WHERE year = 2000 OR artist_name = 'Picasso';

There are no results to be displayed.

---

**Query #4**

    SELECT name, birthplace
    FROM artists
    WHERE EXTRACT(YEAR FROM dateofbirth) BETWEEN 1880 AND 1930;

| name    | birthplace |
| ------- | ---------- |
| Picasso | Malaga     |

---

**Query #5**

    SELECT name, country
    FROM artists
    WHERE style IN ('Modern', 'Baroque', 'Renaissance');

| name       | country |
| ---------- | ------- |
| Caravaggio | Italy   |



---

**Query #6**

    SELECT *
    FROM artworks
    ORDER BY title;

| title          | year | type    | price    | artist_name |
| -------------- | ---- | ------- | -------- | ----------- |
| The Cardsharps | 1594 | Baroque | 40000.00 | Caravaggio  |

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

