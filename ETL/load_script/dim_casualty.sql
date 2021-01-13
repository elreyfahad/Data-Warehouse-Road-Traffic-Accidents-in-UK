CREATE TABLE DW_CASUALTY(
   ID_Casuality NUMBER (10) PRIMARY KEY,
   AgeOfCasualty NUMBER(10),
   ClassCasuality VARCHAR2(100),
   SexCasualty VARCHAR2(100),
   Severity VARCHAR2(100)
   );

-- REMPLISSAGE DE LA TABLE           
INSERT INTO DW_CASUALTY
SELECT c.get_id_casualty(),c.get_age_casualty(),c.get_class_casualty(),c.get_sex_casualty(),c.get_severity()
FROM casualty_tab c;

















