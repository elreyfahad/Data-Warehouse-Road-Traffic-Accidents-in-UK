CREATE OR REPLACE DIRECTORY RepertoireSrc
AS 'C:\Users\m\Desktop\Projet DW\Projet';

CREATE OR REPLACE DIRECTORY RepertoireLog
AS 'C:\Users\m\Desktop\Projet DW\Projet\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('vehicle');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE vehicle';
 END IF;
END;
/

CREATE TABLE vehicle (
ID_Vehicle NUMBER(10),
VehicleType VARCHAR(100),
AgeOfVehicle NUMBER(10),
Engine_Capacity NUMBER(10),
LeftHandDriver VARCHAR(20),
PropulsionCode VARCHAR(100),
ID_Driver NUMBER(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY RepertoireSrc
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
CHARACTERSET UTF8
BADFILE RepertoireLog:'import.vehicle.bad'
LOGFILE RepertoireLog:'import.vehicle.log'
FIELDS TERMINATED BY ','
)
LOCATION ('dim_veh_final.csv')
)
REJECT LIMIT UNLIMITED;

