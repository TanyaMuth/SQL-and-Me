/******************
Module 5: Intro to SQL
INFO 1620
Written by Lisa Thoendel
Last Updated Summer 2022

Name: Tanya Muth

--<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>--

Use the PetOwners create script to answer these questions.
We will use the below area to write our test SQL.

******************/

/* 1) How would you add an age attribute (integer)
      to the Pets table? */

ALTER TABLE Pets
ADD COLUMN Age integer(100)
;

SELECT *
FROM Pets
;

/* 2)  Luma was adopted. How would we remove her record from the Owns table?*/

/* Luma is petID 4; OwnerID is 4*/

SELECT *
FROM Owns
WHERE PetID = 4 AND OwnerID = 4;

/*DELETE*/
DELETE
FROM Owns
WHERE PetID = 4 AND OwnerID = 4;


/* 3) How would you create a new DogBreeds table? */

CREATE TABLE DogBreeds
(breedID char(8) NOT NULL PRIMARY KEY, 
breedName varchar(35))
;

/* 4) How would you insert Pug to the DogBreeds table? */
 
INSERT INTO DogBreeds (breedID, breedName)
VALUES (‘3’,”Pug”); 

/* 5) How would you show the rows of the DogBreeds table to make sure you
     inserted Pug successfully? */

SELECT *
FROM DogBreeds;

/* 6) How would you remove the DogBreeds table? */

DELETE *
FROM DogBreeds;

SHOW TABLES;

DROP TABLE DogBreeds;
  
/* 7) Show which breedID has the most pets. */

SELECT breedID, COUNT(petID)
FROM Pets
GROUP BY breedID
;

/* 8) Show which pet owner has the highest ID number. */

SELECT MAX(OwnerID)
FROM PetOwners
;

/* 9) Show the Pets in alphabetical order by Name */

SELECT *
FROM Pets
ORDER BY petName
;

/* 10) What are the breeds of all the pets? */

SELECT *
FROM Breeds
  JOIN Pets on Breeds.breedID = Pets.breedID
;

/* 11) Bonus! How many pets do each owner have? */

SELECT PetOwners.ownerID, PetOwners.ownerName, COUNT(*) AS ‘# of Pets’
FROM PetOwners
  JOIN Owns on Owns.ownerID = PetOwners.ownerID
GROUP BY PetOwners.ownerID
;
