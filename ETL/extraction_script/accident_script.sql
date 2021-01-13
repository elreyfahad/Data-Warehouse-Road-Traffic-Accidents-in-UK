CREATE OR REPLACE DIRECTORY RepertoireSrc
AS 'C:\Users\m\Desktop\Projet DW\Projet';

CREATE OR REPLACE DIRECTORY RepertoireLog
AS 'C:\Users\m\Desktop\Projet DW\Projet\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('accident');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE accident';
 END IF;
END;
/

CREATE TABLE accident (
ID_Accident NUMBER(10),
AccidentIndex VARCHAR(100),
NumberOfVehicles NUMBER(10),
NumberOfCasualties NUMBER(10),
City VARCHAR(100),
Urban VARCHAR(100),
Road VARCHAR(100),
Longitude VARCHAR(100),
Latitude VARCHAR(100),
DayoOfWeek VARCHAR(100),
DateAccident VARCHAR(100),
TimeAccident VARCHAR(50),
WeatherCondition VARCHAR(100),
LightCondition VARCHAR(100),
ID_Vehicle NUMBER(10),
ID_Casuality NUMBER(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY RepertoireSrc
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
CHARACTERSET UTF8
BADFILE RepertoireLog:'import.accident.bad'
LOGFILE RepertoireLog:'import.accident.log'
FIELDS TERMINATED BY ','
)
LOCATION ('dim_accident.csv')
)
REJECT LIMIT UNLIMITED;

