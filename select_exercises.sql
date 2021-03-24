--Use the albums_db database.
USE albums.db;

--Explore the structure of the albums table.
DESCRIBE albums;

--a. How many rows are in the albums table?
SELECT * FROM albums; 
-- there are 31 rows

----b. How many unique artist names are in the albums table?
SELECT DISTINCT artist FROM albums;
-- there are 23 unique artist names

--c. What is the primary key for the albums table?
-- the primary key is the id

--d. What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT * FROM albums ORDER BY release_date;
-- the oldest releast date is 1967 and the most recent is 2011

--Write queries to find the following information:

--a. The name of all albums by Pink Floyd
SELECT * FROM albums WHERE artist = 'Pink FLoyd';

--b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT * FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- the year was 1967

--c. The genre for the album Nevermind
SELECT * FROM albums WHERE name = 'Nevermind';
-- the genre is Grunge, Alternative rock

--d. Which albums were released in the 1990s
SELECT * FROM albums WHERE release_date BETWEEN 1990 and 1999;
--5	Whitney Houston / Various artists	The Bodyguard	1992	28.4	R&B, Soul, Pop, Soundtrack
--12	Alanis Morissette	Jagged Little Pill	1995	24.4	Alternative rock
--13	Shania Twain	Come On Over	1997	29.6	Country, Pop
--14	Celine Dion	Falling into You	1996	20.2	Pop, Soft rock
--19	Celine Dion	Let's Talk About Love	1997	19.3	Pop, Soft rock
--21	Michael Jackson	Dangerous	1991	16.3	Rock, Funk, Pop
--22	Madonna	The Immaculate Collection	1990	19.4	Pop, Dance
--26	James Horner	Titanic: Music from the Motion Picture	1997	18.1	Soundtrack
--27	Metallica	Metallica	1991	21.2	Thrash metal, Heavy metal
--28	Nirvana	Nevermind	1991	16.7	Grunge, Alternative rock
--30	Santana	Supernatural	1999	20.5	Rock

--e. Which albums had less than 20 million certified sales
SELECT * FROM albums WHERE sales < 20;
--9	Various artists	Grease: The Original Soundtrack from the Motion Picture	1978	14.4	Soundtrack
--11	Michael Jackson	Bad	1987	19.3	Pop, Funk, Rock
--15	The Beatles	Sgt. Pepper's Lonely Hearts Club Band	1967	13.1	Rock
--17	Various artists	Dirty Dancing	1987	17.9	Pop, Rock, R&B
--19	Celine Dion	Let's Talk About Love	1997	19.3	Pop, Soft rock
--21	Michael Jackson	Dangerous	1991	16.3	Rock, Funk, Pop
--22	Madonna	The Immaculate Collection	1990	19.4	Pop, Dance
--23	The Beatles	Abbey Road	1969	14.4	Rock
--24	Bruce Springsteen	Born in the U.S.A.	1984	19.6	Rock
--25	Dire Straits	Brothers in Arms	1985	17.7	Rock, Pop
--26	James Horner	Titanic: Music from the Motion Picture	1997	18.1	Soundtrack
--28	Nirvana	Nevermind	1991	16.7	Grunge, Alternative rock
--29	Pink Floyd	The Wall	1979	17.6	Progressive rock

--f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE genre = "Rock";
--The other genres are not included because the WHERE filter is used and it's specific.