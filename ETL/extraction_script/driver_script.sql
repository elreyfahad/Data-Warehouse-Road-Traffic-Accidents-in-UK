CREATE OR REPLACE DIRECTORY RepertoireSrc
AS 'C:\Users\m\Desktop\Projet DW\Projet';

CREATE OR REPLACE DIRECTORY RepertoireLog
AS 'C:\Users\m\Desktop\Projet DW\Projet\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('driver');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE driver';
 END IF;
END;
/

CREATE TABLE driver (
AgeBand VARCHAR(100),
SexDriver VARCHAR(100),
ID_driver NUMBER(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY RepertoireSrc
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
CHARACTERSET UTF8
BADFILE RepertoireLog:'import.driver.bad'
LOGFILE RepertoireLog:'import.driver.log'
FIELDS TERMINATED BY ','
)
LOCATION ('dim_driver.csv')
)
REJECT LIMIT UNLIMITED;

