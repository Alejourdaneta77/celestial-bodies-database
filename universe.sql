camper: /project$ 
camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> \c universe;
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> CREATE TABLE galaxy();
CREATE TABLE
universe=> CREATE TABLE star();
CREATE TABLE
universe=> CREATE TABLE planet();
CREATE TABLE
universe=> CREATE TABLE moon();
CREATE TABLE
universe=> ALTER TABLE galaxy ADD COLUMN name VARCHAR(30), galaxy_id SERIAL PRIMARY KEY;
ERROR:  syntax error at or near "galaxy_id"
LINE 1: ALTER TABLE galaxy ADD COLUMN name VARCHAR(30), galaxy_id SE...
                                                        ^
universe=> ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL PRIMARY KEY;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN star_id SERIAL PRIMARY KEY;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN planet_id SERIAL PRIMARY KEY;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN moon_id SERIAL PRIMARY KEY;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN numero_planetas INT, numero_estrellas INT;
ERROR:  syntax error at or near "numero_estrellas"
LINE 1: ...LTER TABLE galaxy ADD COLUMN numero_planetas INT, numero_est...
                                                             ^
universe=> ALTER TABLE galaxy ADD COLUMN numero_planetas INT;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN numero_estrellas INT;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN diametro NUMERIC;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN radio NUMERIC;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN alias TEXT;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN fria BOOLEAN;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN calida BOOLEAN;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN galaxy_id;
ERROR:  syntax error at or near ";"
LINE 1: ALTER TABLE star ADD COLUMN galaxy_id;
                                             ^
universe=> ALTER TABLE star ADD COLUMN galaxy_id ();
ERROR:  syntax error at or near "("
LINE 1: ALTER TABLE star ADD COLUMN galaxy_id ();
                                              ^
universe=> ALTER TABLE star ADD COLUMN galaxy_id SERIAL;
ALTER TABLE
universe=> ALTER TABLE star ADD CONSTRAINT fk_star_galaxy FOREIGN key(galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE
universe=> ALTER TABLE star DROP CONSTRAINT fk_star_galaxy;
ALTER TABLE
universe=> ALTER TABLE star DROP COLUMN galaxy_id;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN galaxy_id INT;
ALTER TABLE
universe=> ALTER TABLE star
universe-> ADD CONSTRAINT fk_star_galaxy
universe-> FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE
universe=> ALTER TABLE star ALTER COLUMN galaxy_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN star_id INT;
ALTER TABLE
universe=> ALTER TABLE planet
universe-> ADD CONSTRAINT fk_planet_star
universe-> FOREIGN KEY (star_id) REFERENCES star(star_id);
ALTER TABLE
universe=> ALTER TABLE planet ALTER COLUMN star_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN planet_id INT;
ALTER TABLE
universe=> ALTER TABLE moon
universe-> ADD CONSTRAINT fk_moon_planet
universe-> FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ALTER TABLE
universe=> ALTER TABLE moon ALTER COLUMN planet_id SET NOT NULL;
ALTER TABLE
universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | moon                 | table    | freecodecamp |
| public | moon_moon_id_seq     | sequence | freecodecamp |
| public | planet               | table    | freecodecamp |
| public | planet_planet_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(8 rows)

universe=> \d galaxy
                                             Table "public.galaxy"
+------------------+-----------------------+-----------+----------+-------------------------------------------+
|      Column      |         Type          | Collation | Nullable |                  Default                  |
+------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id        | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name             | character varying(30) |           |          |                                           |
| numero_planetas  | integer               |           |          |                                           |
| numero_estrellas | integer               |           |          |                                           |
| diametro         | numeric               |           |          |                                           |
| radio            | numeric               |           |          |                                           |
| alias            | text                  |           |          |                                           |
| fria             | boolean               |           |          |                                           |
| calida           | boolean               |           |          |                                           |
+------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
Referenced by:
    TABLE "star" CONSTRAINT "fk_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> CREATE TABLE cometas ();
CREATE TABLE
universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | cometas              | table    | freecodecamp |
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | moon                 | table    | freecodecamp |
| public | moon_moon_id_seq     | sequence | freecodecamp |
| public | planet               | table    | freecodecamp |
| public | planet_planet_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(9 rows)

universe=> ALTER TABLE cometas ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE cometas ADD COLUMN cometas_id PRIMARY KEY;
ERROR:  syntax error at or near "PRIMARY"
LINE 1: ALTER TABLE cometas ADD COLUMN cometas_id PRIMARY KEY;
                                                  ^
universe=> ALTER TABLE cometas ADD COLUMN cometas_id SERIAL PRIMARY KEY;
ALTER TABLE
universe=> ALTER TABLE cometas ADD COLUMN cometas_1 INT;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN star_1 INT;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN star_2 INT;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN planet_1 INT;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN planet_2 INT;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN moon_1 INT;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN moon_2 INT;
ALTER TABLE
universe=> \d galaxy
                                             Table "public.galaxy"
+------------------+-----------------------+-----------+----------+-------------------------------------------+
|      Column      |         Type          | Collation | Nullable |                  Default                  |
+------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id        | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name             | character varying(30) |           |          |                                           |
| numero_planetas  | integer               |           |          |                                           |
| numero_estrellas | integer               |           |          |                                           |
| diametro         | numeric               |           |          |                                           |
| radio            | numeric               |           |          |                                           |
| alias            | text                  |           |          |                                           |
| fria             | boolean               |           |          |                                           |
| calida           | boolean               |           |          |                                           |
+------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
Referenced by:
    TABLE "star" CONSTRAINT "fk_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> \d star
                                        Table "public.star"
+-----------+-----------------------+-----------+----------+---------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                |
+-----------+-----------------------+-----------+----------+---------------------------------------+
| star_id   | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name      | character varying(30) |           |          |                                       |
| galaxy_id | integer               |           | not null |                                       |
| star_1    | integer               |           |          |                                       |
| star_2    | integer               |           |          |                                       |
+-----------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
Foreign-key constraints:
    "fk_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "fk_planet_star" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> \d planet
                                         Table "public.planet"
+-----------+-----------------------+-----------+----------+-------------------------------------------+
|  Column   |         Type          | Collation | Nullable |                  Default                  |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name      | character varying(30) |           |          |                                           |
| star_id   | integer               |           | not null |                                           |
| planet_1  | integer               |           |          |                                           |
| planet_2  | integer               |           |          |                                           |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
Foreign-key constraints:
    "fk_planet_star" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "fk_moon_planet" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d moon
                                        Table "public.moon"
+-----------+-----------------------+-----------+----------+---------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                |
+-----------+-----------------------+-----------+----------+---------------------------------------+
| moon_id   | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name      | character varying(30) |           |          |                                       |
| planet_id | integer               |           | not null |                                       |
| moon_1    | integer               |           |          |                                       |
| moon_2    | integer               |           |          |                                       |
+-----------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
Foreign-key constraints:
    "fk_moon_planet" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO galaxy (name, numero_planetas, numero_estrellas) VALUES ("andromeda", 1000000, 500)
universe-> ;
ERROR:  column "andromeda" does not exist
LINE 1: ...(name, numero_planetas, numero_estrellas) VALUES ("andromeda...
                                                             ^
universe=> INSERT INTO galaxy (name, numero_planetas, numero_estrellas) VALUES ('andromeda', 1000000, 500)
;
universe-> ;
INSERT 0 1
universe=> INSERT INTO star (name, star_1, star_2) VALUES ('sol', 1, 2)
;
universe-> ;
ERROR:  null value in column "galaxy_id" violates not-null constraint
DETAIL:  Failing row contains (1, sol, null, 1, 2).
universe=> INSERT INTO star (name, star_1, star_2) VALUES ('sol', 33, 44)
;
universe-> ;
ERROR:  null value in column "galaxy_id" violates not-null constraint
DETAIL:  Failing row contains (2, sol, null, 33, 44).
universe=> INSERT INTO star (name, star_1, star_2, galaxy_id) VALUES ('sol', 33, 44, 1);
INSERT 0 1
universe=> INSERT INTO planet (name, planet_1, planet_2, star_id) VALUES ('tierra', 1111, 2222, 1);
ERROR:  insert or update on table "planet" violates foreign key constraint "fk_planet_star"
DETAIL:  Key (star_id)=(1) is not present in table "star".
universe=> SELECT galaxy
universe-> ;
ERROR:  column "galaxy" does not exist
LINE 1: SELECT galaxy
               ^
universe=> INSERT INTO galaxy (galaxy_id) VALUES (1, 2, 3);
ERROR:  INSERT has more expressions than target columns
LINE 1: INSERT INTO galaxy (galaxy_id) VALUES (1, 2, 3);
                                                  ^
universe=> INSERT INTO galaxy (name, numero_planetas, numero_estrellas) VALUES ('vialactea', 144, 244), ('otra', 3333, 5555);
INSERT 0 2
universe=> INSERT INTO star (name, star_1, star_2) VALUES ('solecito', 8,9), ('solesote, 3, 6), ('sol', 8, 99);
universe'> 
universe'> '
universe(> (
universe(> )
universe(> \cancel
invalid command \cancel
Try \? for help.
universe(> 
universe=> INSERT INTO star (name, star_1, star_2) VALUES ('solecito', 8,9), ('solesote', 3, 6), ('sol', 8, 99);
ERROR:  null value in column "galaxy_id" violates not-null constraint
DETAIL:  Failing row contains (4, solecito, null, 8, 9).
universe=> INSERT INTO star (name, star_1, star_2, galaxy_id) VALUES ('solecito', 8, 9, 1), ('solesote', 3, 6, 2), ('sol', 8, 99, 3);
INSERT 0 3
universe=> INSERT INTO planet (name, star_1, star_2, star_id) VALUES ('mercurio', 453, 454, 1), ('marte', 4, 76, 2), ('tierra', 6, 88, 3);
ERROR:  column "star_1" of relation "planet" does not exist
LINE 1: INSERT INTO planet (name, star_1, star_2, star_id) VALUES ('...
                                  ^
universe=> INSERT INTO planet (name, planet_1, planet_2, star_id) VALUES ('mercurio', 453, 454, 1), ('marte', 4, 76, 2), ('tierra', 6, 88, 3
);
ERROR:  insert or update on table "planet" violates foreign key constraint "fk_planet_star"
DETAIL:  Key (star_id)=(1) is not present in table "star".
universe=> SELECT star_id;
ERROR:  column "star_id" does not exist
LINE 1: SELECT star_id;
               ^
universe=> SELECT * star;
ERROR:  syntax error at or near "star"
LINE 1: SELECT * star;
                 ^
universe=> SELECT * FROM star;
+---------+----------+-----------+--------+--------+
| star_id |   name   | galaxy_id | star_1 | star_2 |
+---------+----------+-----------+--------+--------+
|       3 | sol      |         1 |     33 |     44 |
|       5 | solecito |         1 |      8 |      9 |
|       6 | solesote |         2 |      3 |      6 |
|       7 | sol      |         3 |      8 |     99 |
+---------+----------+-----------+--------+--------+
(4 rows)

universe=> DELETE FROM star WHERE star_id=7;
DELETE 1
universe=> SELECT * star;
ERROR:  syntax error at or near "star"
LINE 1: SELECT * star;
                 ^
universe=> SELECT * FROM star;
+---------+----------+-----------+--------+--------+
| star_id |   name   | galaxy_id | star_1 | star_2 |
+---------+----------+-----------+--------+--------+
|       3 | sol      |         1 |     33 |     44 |
|       5 | solecito |         1 |      8 |      9 |
|       6 | solesote |         2 |      3 |      6 |
+---------+----------+-----------+--------+--------+
(3 rows)

universe=> UPDATE star SET star_id=100 WHERE name='sol';
UPDATE 1
universe=> UPDATE star SET star_id=101 WHERE name='solecito';
UPDATE 1
universe=> UPDATE star SET star_id=102 WHERE name='solesote';
UPDATE 1
universe=> UPDATE star SET star_id=1 WHERE star_id=100;
UPDATE 1
universe=> UPDATE star SET star_id=2 WHERE star_id=101;
UPDATE 1
universe=> UPDATE star SET star_id=3 WHERE star_id=102;
UPDATE 1
universe=> SELECT * FROM star;
+---------+----------+-----------+--------+--------+
| star_id |   name   | galaxy_id | star_1 | star_2 |
+---------+----------+-----------+--------+--------+
|       1 | sol      |         1 |     33 |     44 |
|       2 | solecito |         1 |      8 |      9 |
|       3 | solesote |         2 |      3 |      6 |
+---------+----------+-----------+--------+--------+
(3 rows)

universe=> UPDATE star SET galaxy_id=4 WHERE star_id=2;
ERROR:  insert or update on table "star" violates foreign key constraint "fk_star_galaxy"
DETAIL:  Key (galaxy_id)=(4) is not present in table "galaxy".
universe=> UPDATE star SET galaxy_id=3 WHERE star_id=2;
UPDATE 1
universe=> SELECT * FROM planet;
+-----------+------+---------+----------+----------+
| planet_id | name | star_id | planet_1 | planet_2 |
+-----------+------+---------+----------+----------+
+-----------+------+---------+----------+----------+
(0 rows)

universe=> INSERT INTO planet (name, planet_1, planet_2, star_id) VALUES ('mercurio', 453, 454, 1), ('marte', 4, 76, 2), ('tierra', 6, 88, 3 
universe(> );
INSERT 0 3
universe=> SELECT * FROM planet;
+-----------+----------+---------+----------+----------+
| planet_id |   name   | star_id | planet_1 | planet_2 |
+-----------+----------+---------+----------+----------+
|         5 | mercurio |       1 |      453 |      454 |
|         6 | marte    |       2 |        4 |       76 |
|         7 | tierra   |       3 |        6 |       88 |
+-----------+----------+---------+----------+----------+
(3 rows)

universe=> 
universe=> INSERT INTO moon (name, moon_1, moon_2, planet_id) VALUES ('luna', 453, 454, 5), ('lunita', 4, 76, 6), ('lunera', 6, 88, 7);
INSERT 0 3
universe=> SELECT * FROM moon;
+---------+--------+-----------+--------+--------+
| moon_id |  name  | planet_id | moon_1 | moon_2 |
+---------+--------+-----------+--------+--------+
|       1 | luna   |         5 |    453 |    454 |
|       2 | lunita |         6 |      4 |     76 |
|       3 | lunera |         7 |      6 |     88 |
+---------+--------+-----------+--------+--------+
(3 rows)

universe=> INSERT INTO cometa (name, cometa_1, cometa_2) VALUES ('cometin', 4534545, 4546), ('cometota', 46, 676), ('cometita', 6, 88);
ERROR:  relation "cometa" does not exist
LINE 1: INSERT INTO cometa (name, cometa_1, cometa_2) VALUES ('comet...
                    ^
universe=> INSERT INTO cometas (name, cometa_1, cometa_2) VALUES ('cometin', 4534545, 4546), ('cometota', 46, 676), ('cometita', 6, 88);
ERROR:  column "cometa_1" of relation "cometas" does not exist
LINE 1: INSERT INTO cometas (name, cometa_1, cometa_2) VALUES ('come...
                                   ^
universe=> INSERT INTO cometas (name, cometas_1, cometas_2) VALUES ('cometin', 4534545, 4546), ('cometota', 46, 676), ('cometita', 6, 88);
ERROR:  column "cometas_2" of relation "cometas" does not exist
LINE 1: INSERT INTO cometas (name, cometas_1, cometas_2) VALUES ('co...
                                              ^
universe=> \d comets
Did not find any relation named "comets".
universe=> \d cometas;
                                          Table "public.cometas"
+------------+-----------------------+-----------+----------+---------------------------------------------+
|   Column   |         Type          | Collation | Nullable |                   Default                   |
+------------+-----------------------+-----------+----------+---------------------------------------------+
| name       | character varying(30) |           |          |                                             |
| cometas_id | integer               |           | not null | nextval('cometas_cometas_id_seq'::regclass) |
| cometas_1  | integer               |           |          |                                             |
+------------+-----------------------+-----------+----------+---------------------------------------------+
Indexes:
    "cometas_pkey" PRIMARY KEY, btree (cometas_id)

universe=> INSERT INTO cometas (name, cometas_1, cometas_id) VALUES ('cometin', 4534545, 4546), ('cometota', 46, 676), ('cometita', 6, 88);
INSERT 0 3
universe=> ALTER TABLE cometas ALTER COLUMN name SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE cometas ALTER COLUMN cometas_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE galaxy  ALTER COLUMN galaxy_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE galaxy  ALTER COLUMN name SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE star ALTER COLUMN name SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE star ALTER COLUMN star_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE planet ALTER COLUMN planet_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE planet ALTER COLUMN name SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE moon ALTER COLUMN name SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE moon ALTER COLUMN moon_id SET NOT NULL;
ALTER TABLE
universe=> ALTER TABLE star  ALTER COLUMN star_1 SET UNIQUE;
ERROR:  syntax error at or near "UNIQUE"
LINE 1: ALTER TABLE star  ALTER COLUMN star_1 SET UNIQUE;
                                                  ^
universe=> ALTER TABLE star ADD CONSTRAINT unique_star_1 UNIQUE star_1;
ERROR:  syntax error at or near "star_1"
LINE 1: ALTER TABLE star ADD CONSTRAINT unique_star_1 UNIQUE star_1;
                                                             ^
universe=> \d star
                                        Table "public.star"
+-----------+-----------------------+-----------+----------+---------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                |
+-----------+-----------------------+-----------+----------+---------------------------------------+
| star_id   | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name      | character varying(30) |           | not null |                                       |
| galaxy_id | integer               |           | not null |                                       |
| star_1    | integer               |           |          |                                       |
| star_2    | integer               |           |          |                                       |
+-----------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
Foreign-key constraints:
    "fk_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "fk_planet_star" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> ALTER TABLE star ADD CONSTRAINT unique_star_1 UNIQUE (star_1);
ALTER TABLE
universe=> ALTER TABLE galaxy  ADD CONSTRAINT unique_name, UNIQUE (name);
ERROR:  syntax error at or near ","
LINE 1: ALTER TABLE galaxy  ADD CONSTRAINT unique_name, UNIQUE (name...
                                                      ^
universe=> ALTER TABLE galaxy  ADD CONSTRAINT unique_name UNIQUE (name);
ALTER TABLE
universe=> ALTER TABLE star  ADD CONSTRAINT unique_name UNIQUE (name);
ERROR:  relation "unique_name" already exists
universe=> ALTER TABLE planet  ADD CONSTRAINT unique_name_ UNIQUE (name);
ALTER TABLE
universe=> ALTER TABLE moon  ADD CONSTRAINT unique_name_ UNIQUE (name);
ERROR:  relation "unique_name_" already exists
universe=> ALTER TABLE moon  ADD CONSTRAINT unique_name_2 UNIQUE (name);
ALTER TABLE
universe=> ALTER TABLE cometas ADD CONSTRAINT unique_name_4 UNIQUE (name);
ALTER TABLE
universe=> INSERT INTO galaxy (name, numero_planetas, numero_estrellas, diametro, alias, fria, calida)
universe-> VALUES ('Sombrero', 200000, 150, 50000.2, 'M104', true, false),
universe-> ('Messier 87', 600000, 600, 120000.9, 'M87', false, true),
universe-> ('Whirlpool', 300000, 200, 60000.4, 'M51', true, false),
universe-> ('Triangulum', 150000, 100, 70000.6, 'M33', true, false);
INSERT 0 4
universe=> INSERT INTO star (name, galaxy_id, star_1, star_2)
universe-> VALUES ('Proxima', 2, 10, 11),
universe-> ('Vega', 1, 20, 21),
universe-> ('Sirius', 1, 30, 31),
universe-> ('Betelgeuse', 3, 40, 41),
universe-> ('Rigel', 4, 50, 51);
INSERT 0 5
universe=> INSERT INTO planet (name, star_id, planet_1, planet_2)
universe-> VALUES ('Mercurio', 1, 1, 2),
universe-> ('Venus', 1, 3, 4),
universe-> ('Tierra', 1, 5, 6),
universe-> ('Marte', 1, 7, 8),
universe-> ('Jupiter', 2, 9, 10),
universe-> ('Saturno', 2, 11, 12),
universe-> ('Urano', 3, 13, 14),
universe-> ('Neptuno', 3, 15, 16),
universe-> ('Kepler-22b', 4, 17, 18),
universe-> ('Gliese 581g', 4, 19, 20),
universe-> ('HD 209458 b', 5, 21, 22),
universe-> ('TrES-2b', 6, 23, 24);
ERROR:  insert or update on table "planet" violates foreign key constraint "fk_planet_star"
DETAIL:  Key (star_id)=(4) is not present in table "star".
universe=> INSERT INTO planet (name, star_id, planet_1, planet_2)
universe-> VALUES ('Jupiter', 2, 9, 10),
universe-> ('Saturno', 2, 11, 12),
universe-> ('Urano', 3, 13, 14),
universe-> ('Neptuno', 3, 15, 16),
universe-> ('Kepler-22b', 4, 17, 18),
universe-> ('Gliese 581g', 4, 19, 20),
universe-> ('HD 209458 b', 5, 21, 22),
universe-> ('TrES-2b', 6, 23, 24), ('Mercurio', 1, 1, 2),
universe-> 
universe-> ;
ERROR:  syntax error at or near ";"
LINE 10: ;
         ^
universe=> INSERT INTO planet (name, star_id, planet_1, planet_2)
VALUES ('Jupiter', 2, 9, 10),
('Saturno', 2, 11, 12),
('Urano', 3, 13, 14),
('Neptuno', 3, 15, 16),
('Kepler-22b', 4, 17, 18),
('Gliese 581g', 4, 19, 20),
('HD 209458 b', 5, 21, 22),
('TrES-2b', 6, 23, 24);
universe-> ;
ERROR:  syntax error at or near ";"
LINE 2: ;
        ^
universe=> INSERT INTO planet (name, star_id, planet_1, planet_2)
universe-> VALUES
universe-> ('Aldoria', 1, 1, 2),
universe-> ('Zenthor', 1, 3, 4),
universe-> ('Nebulon', 1, 5, 6),
universe-> ('Cryonis', 1, 7, 8),
universe-> ('Xelora', 2, 9, 10),
universe-> ('Velkar', 2, 11, 12),
universe-> ('Orionis', 3, 13, 14),
universe-> ('Kryntar', 3, 15, 16),
universe-> ('Ulthar', 4, 17, 18),
universe-> ('Mordara', 4, 19, 20),
universe-> ('Thaloria', 5, 21, 22),
universe-> ('Vorlon', 6, 23, 24);
ERROR:  insert or update on table "planet" violates foreign key constraint "fk_planet_star"
DETAIL:  Key (star_id)=(4) is not present in table "star".
universe=> INSERT INTO planet (name, star_id, planet_1, planet_2)
universe-> VALUES
universe-> ('Aldoria', 1, 1, 2),
universe-> ('Zenthor', 1, 3, 4),
universe-> ('Nebulon', 1, 5, 6),
universe-> ('Cryonis', 1, 7, 8),
universe-> ('Xelora', 2, 9, 10),
universe-> ('Velkar', 2, 11, 12),
universe-> ('Orionis', 3, 13, 14),
universe-> ('Kryntar', 3, 15, 16),
universe-> ('Ulthar', 4, 17, 18),
universe-> ('Mordara', 4, 19, 20),
universe-> ('Thaloria', 5, 21, 22),
universe-> ('Vorlon', 6, 23, 24);
ERROR:  insert or update on table "planet" violates foreign key constraint "fk_planet_star"
DETAIL:  Key (star_id)=(4) is not present in table "star".
universe=> SELECT * FROM star;
+---------+------------+-----------+--------+--------+
| star_id |    name    | galaxy_id | star_1 | star_2 |
+---------+------------+-----------+--------+--------+
|       1 | sol        |         1 |     33 |     44 |
|       3 | solesote   |         2 |      3 |      6 |
|       2 | solecito   |         3 |      8 |      9 |
|       8 | Proxima    |         2 |     10 |     11 |
|       9 | Vega       |         1 |     20 |     21 |
|      10 | Sirius     |         1 |     30 |     31 |
|      11 | Betelgeuse |         3 |     40 |     41 |
|      12 | Rigel      |         4 |     50 |     51 |
+---------+------------+-----------+--------+--------+
(8 rows)

universe=> INSERT INTO planet (name, star_id, planet_1, planet_2) VALUES
universe-> ('Aldoria', 1, 101, 102),
universe-> ('Zenthor', 1, 103, 104),
universe-> ('Nebulon', 2, 105, 106),
universe-> ('Cryonis', 2, 107, 108),
universe-> ('Xelora', 3, 109, 110),
universe-> ('Velkar', 3, 111, 112),
universe-> ('Orionis', 8, 113, 114),
universe-> ('Kryntar', 8, 115, 116),
universe-> ('Ulthar', 9, 117, 118),
universe-> ('Mordara', 10, 119, 120),
universe-> ('Thaloria', 11, 121, 122),
universe-> ('Vorlon', 12, 123, 124);
INSERT 0 12
universe=> INSERT INTO moon (name, planet_id, moon_1, moon_2) VALUES
universe-> ('Lunaris', 1, 201, 202),
universe-> ('Noctis', 1, 203, 204),
universe-> ('Selene', 2, 205, 206),
universe-> ('Umbra', 2, 207, 208),
universe-> ('Astra', 3, 209, 210),
universe-> ('Nyx', 3, 211, 212),
universe-> ('Phobos', 4, 213, 214),
universe-> ('Deimos', 4, 215, 216),
universe-> ('Eos', 5, 217, 218),
universe-> ('Aurora', 5, 219, 220),
universe-> ('Hyperion', 6, 221, 222),
universe-> ('Titan', 6, 223, 224),
universe-> ('Atlas', 7, 225, 226),
universe-> ('Pandora', 7, 227, 228),
universe-> ('Prometheus', 8, 229, 230),
universe-> ('Epimetheus', 8, 231, 232),
universe-> ('Elara', 9, 233, 234),
universe-> ('Leda', 9, 235, 236),
universe-> ('Himalia', 10, 237, 238),
universe-> ('Carme', 11, 239, 240);
ERROR:  insert or update on table "moon" violates foreign key constraint "fk_moon_planet"
DETAIL:  Key (planet_id)=(1) is not present in table "planet".
universe=> SELECT * FROM planet
universe-> ;
+-----------+----------+---------+----------+----------+
| planet_id |   name   | star_id | planet_1 | planet_2 |
+-----------+----------+---------+----------+----------+
|         5 | mercurio |       1 |      453 |      454 |
|         6 | marte    |       2 |        4 |       76 |
|         7 | tierra   |       3 |        6 |       88 |
|        44 | Aldoria  |       1 |      101 |      102 |
|        45 | Zenthor  |       1 |      103 |      104 |
|        46 | Nebulon  |       2 |      105 |      106 |
|        47 | Cryonis  |       2 |      107 |      108 |
|        48 | Xelora   |       3 |      109 |      110 |
|        49 | Velkar   |       3 |      111 |      112 |
|        50 | Orionis  |       8 |      113 |      114 |
|        51 | Kryntar  |       8 |      115 |      116 |
|        52 | Ulthar   |       9 |      117 |      118 |
|        53 | Mordara  |      10 |      119 |      120 |
|        54 | Thaloria |      11 |      121 |      122 |
|        55 | Vorlon   |      12 |      123 |      124 |
+-----------+----------+---------+----------+----------+
(15 rows)

universe=> INSERT INTO moon (name, planet_id, moon_1, moon_2) VALUES
universe-> ('Lunaris', 44, 201, 202),
universe-> ('Noctis', 44, 203, 204),
universe-> ('Selene', 45, 205, 206),
universe-> ('Umbra', 45, 207, 208),
universe-> ('Astra', 46, 209, 210),
universe-> ('Nyx', 46, 211, 212),
universe-> ('Phobos', 47, 213, 214),
universe-> ('Deimos', 47, 215, 216),
universe-> ('Eos', 48, 217, 218),
universe-> ('Aurora', 48, 219, 220),
universe-> ('Hyperion', 49, 221, 222),
universe-> ('Titan', 49, 223, 224),
universe-> ('Atlas', 50, 225, 226),
universe-> ('Pandora', 50, 227, 228),
universe-> ('Prometheus', 51, 229, 230),
universe-> ('Epimetheus', 51, 231, 232),
universe-> ('Elara', 52, 233, 234),
universe-> ('Leda', 52, 235, 236),
universe-> ('Himalia', 53, 237, 238),
universe-> ('Carme', 54, 239, 240);
INSERT 0 20
universe=> 