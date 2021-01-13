CREATE OR REPLACE DIRECTORY RepertoireSrc
AS 'C:\Users\m\Desktop\Projet DW\Projet';

CREATE OR REPLACE DIRECTORY RepertoireLog
AS 'C:\Users\m\Desktop\Projet DW\Projet\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('casualty');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE casualty';
 END IF;
END;
/

CREATE TABLE casualty (
ID_Casuality NUMBER (10),
AgeOfCasualty NUMBER(10),
ClassCasuality VARCHAR(100),
SexCasualty VARCHAR(100),
Severity VARCHAR(100),
ID_Accident NUMBER(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY RepertoireSrc
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
CHARACTERSET UTF8
BADFILE RepertoireLog:'import.casualty.bad'
LOGFILE RepertoireLog:'import.casualty.log'
FIELDS TERMINATED BY ','
)
LOCATION ('dim_casuality.csv')
)
REJECT LIMIT UNLIMITED;

