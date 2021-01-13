CREATE OR REPLACE TYPE CASUALTY_TYPE AS OBJECT (
   ID_Casuality NUMBER (10),
   AgeOfCasualty NUMBER(10),
   ClassCasuality VARCHAR2(100),
   SexCasualty VARCHAR2(100),
   Severity VARCHAR2(100),
   ID_Accident NUMBER(10),
   MEMBER FUNCTION get_id_casualty RETURN NUMBER,
	 MEMBER FUNCTION get_age_casualty RETURN NUMBER,
   MEMBER FUNCTION get_class_casualty RETURN VARCHAR2,
   MEMBER FUNCTION get_sex_casualty RETURN VARCHAR2,
   MEMBER FUNCTION get_severity RETURN VARCHAR2
   );
/
show errors;
CREATE OR REPLACE TYPE BODY CASUALTY_TYPE AS 
   MEMBER FUNCTION get_id_casualty RETURN NUMBER IS
   BEGIN
      RETURN ID_Casuality;
   END;

   MEMBER FUNCTION get_age_casualty RETURN NUMBER IS
   BEGIN
      RETURN AgeOfCasualty;
   END;
   MEMBER FUNCTION get_class_casualty RETURN VARCHAR2 IS
   BEGIN
      RETURN ClassCasuality;
   END;

   MEMBER FUNCTION get_sex_casualty RETURN VARCHAR2 IS
   BEGIN
      RETURN SexCasualty;
   END;

   MEMBER FUNCTION get_severity RETURN VARCHAR2 IS
   BEGIN
      RETURN Severity;
   END;

 END;
 /
show errors;


-- CREATION DE LA TABLE CASUALTY_TAB POUR LE TYPE CASUALTY
CREATE TABLE casualty_tab OF CASUALTY_TYPE
( CONSTRAINT PK_casualty PRIMARY KEY (ID_Casuality));


CREATE TABLE exceptions_casualty (
row_id rowid,
owner varchar2(30),
casualty_tab varchar2(30),
constraint varchar2(30) );

---- DESACTIVATION DES CONTRAINTES
ALTER TABLE casualty_tab DISABLE CONSTRAINT PK_casualty;


------ COPIE DE DONNEES DE LA ZONE EXTRACTION
INSERT INTO casualty_tab(ID_Casuality,AgeOfCasualty,ClassCasuality,SexCasualty,Severity,ID_Accident) SELECT ID_Casuality,AgeOfCasualty,ClassCasuality,SexCasualty,Severity,ID_Accident FROM casualty;


----- REACTIVATION DES CONTRAINTES
ALTER TABLE casualty_tab ENABLE CONSTRAINT PK_casualty;

EXCEPTIONS INTO exceptions_casualty ;
SELECT * FROM casualty_tab WHERE rowid IN (SELECT row_id FROM exceptions_casualty);


