

-- CREATION DU TYPE DRIVER

CREATE OR REPLACE TYPE DRIVER_TYPE AS OBJECT (
   ID_driver NUMBER(10),
	AgeBand VARCHAR2(100),
   SexDriver VARCHAR2(100),
	MEMBER FUNCTION get_age_band RETURN VARCHAR2,
   MEMBER FUNCTION get_id_driver RETURN NUMBER,
	MEMBER FUNCTION get_sex_driver RETURN VARCHAR2
   );
   /
show errors;


------ CREATION DU CORPS DU TYPE  DRIVER
CREATE OR REPLACE TYPE BODY DRIVER_TYPE AS 
   MEMBER FUNCTION get_id_driver RETURN NUMBER IS
   BEGIN
      RETURN ID_driver;
   END;

   MEMBER FUNCTION get_age_band RETURN VARCHAR2 IS
   BEGIN
      RETURN AgeBand;
   END;
   MEMBER FUNCTION get_sex_driver RETURN VARCHAR2 IS
   BEGIN
      RETURN SexDriver;
   END;
 END;
 /
show errors;

-- CREATION DE LA TABLE DRIVER_TAB POUR LE TYPE DRIVER
DROP TABLE driver_tab;
CREATE TABLE driver_tab OF DRIVER_TYPE
( CONSTRAINT PK_driver PRIMARY KEY (ID_driver));


CREATE TABLE exceptions_driver (
row_id rowid,
owner varchar2(30),
driver_tab varchar2(30),
constraint varchar2(30) );

---- DESACTIVATION DES CONTRAINTES
ALTER TABLE driver_tab DISABLE CONSTRAINT PK_driver;


------ COPIE DE DONNEES DE LA ZONE EXTRACTION
INSERT INTO driver_tab(ID_driver,AgeBand,SexDriver) SELECT ID_driver,AgeBand,SexDriver FROM driver;


----- REACTIVATION DES CONTRAINTES
ALTER TABLE driver_tab ENABLE CONSTRAINT PK_driver;

EXCEPTIONS INTO exceptions_driver ;
SELECT * FROM driver_tab WHERE rowid IN (SELECT row_id FROM exceptions_driver);





