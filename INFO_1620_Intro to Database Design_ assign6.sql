/******************
Module 6: More SQL
INFO 1620
Written by Lisa Thoendel
Last Updated Summer 2022
--<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>--

NAME: Tanya Muth

Use the PetOwners create script to answer these questions.
We will use the below area to write our test SQL.

******************/


/* 1) Join pet owners and breeds together with a natural join and select all rows.
How are the rows matched? (type your response here)

**A: **
*/

SELECT *
FROM PetOwners, Breeds
;

/* 2) Now let's look at an inner join. Write a query to show the owner's ID, name and their pets' IDs.
*/

SELECT p.ownerID, p.ownerName, o.petID, o.ownerID 
FROM PetOwners p
 JOIN Owns o 
 on p.ownerID = o.ownerID
;

/*  3) Next we'll add in the pets! List all the pet IDs and names with their owners.
*/

SELECT *
FROM PetOwners p
 JOIN Owns o  
  on p.ownerID = o.ownerID
 JOIN Pets x 
  ON x.petID = o.petID
;

/*  4) What types of pets are and aren't owned by our owners? Use an outer join to show
    a listing of types with all the pets assigned. Make sure to include types with no
    pets
*/

SELECT *
FROM Breeds b
 LEFT OUTER JOIN Pets p ON b.breedID = p.breedID
;

/*  5) By using the NOT IN operator, we can target a list of types that are
    not owned. List only those types.
*/

SELECT *
FROM Breeds b
WHERE breedID NOT IN 
 (SELECT breedID
 FROM Pets)
;

/*  6) Use the IN operator to show what breeds Beth (ownerID 1) owns.
*/

SELECT breedName
FROM Breeds
WHERE breedID IN
 (
 SELECT breedID
 FROM Pets
 WHERE petID IN
  (
  SELECT petID
  FROM Owns
  WHERE ownerID IN
   (
   SELECT ownerID
   FROM PetOwners
   WHERE ownerName = 'Beth Anderson'
   )
  )
 )
;

/*  7) Show the same result by using EXISTS.
*/

SELECT *
FROM Breeds b
WHERE NOT EXISTS
 (
 SELECT *
 FROM Pets
 WHERE Breeds.breedID = Pets.breedID
  (
  SELECT *
  FROM Owns
  WHERE Owns.petID = Pets.petID
  )
 )
;

/*  8) Build a master list showing each owner and the pets they own.
    Include the type and breed names.
    This brings our whole schema together!
*/

SELECT p.ownerName, x.petName, b.type, b.breedName
FROM PetOwners p
 JOIN Owns o ON p.ownerID = o.ownerID
 JOIN Pets x ON o.petID = x.petID
 JOIN Breeds b ON x.breedID = b.breedID 
;

/*  9) Build a view based on #8 called FurBabies.
*/

CREATE VIEW FurBabies
AS
SELECT p.ownerName, x.petName, b.type, b.breedName
FROM PetOwners p
 JOIN Owns o ON p.ownerID = o.ownerID
 JOIN Pets x ON o.petID = x.petID
 JOIN Breeds b ON x.breedID = b.breedID 
;


/*  10) Query the FurBabies view for the non-furry (fish or bird) pets.
*/

SELECT *
FROM Furbabies
WHERE type = 'fish' OR type = 'bird'
;
