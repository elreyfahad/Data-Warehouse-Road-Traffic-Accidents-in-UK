CREATE OR REPLACE TYPE VEHICLE_TYPE AS OBJECT (
   ID_Vehicle NUMBER(10),
   VehicleType VARCHAR2(100),
   AgeOfVehicle NUMBER(10),
   Engine_Capacity NUMBER(10),
   LeftHandDriver VARCHAR2(20),
   PropulsionCode VARCHAR2(100),
   ID_Driver NUMBER(10),
    MEMBER FUNCTION get_id_vehicle RETURN NUMBER,
	  MEMBER FUNCTION get_vehicle_type RETURN VARCHAR2,
    MEMBER FUNCTION get_age_vehicle RETURN NUMBER,
    MEMBER FUNCTION get_engine_capacity RETURN NUMBER,
    MEMBER FUNCTION get_lefthand_driver RETURN VARCHAR2,
    MEMBER FUNCTION get_propuslion_code RETURN VARCHAR2,
    MEMBER FUNCTION get_id_driver RETURN NUMBER);
/
show errors;
CREATE OR REPLACE TYPE BODY VEHICLE_TYPE AS 
   MEMBER FUNCTION get_id_vehicle RETURN NUMBER IS
   BEGIN
      RETURN ID_Vehicle;
   END;

   MEMBER FUNCTION get_vehicle_type RETURN VARCHAR2 IS
   BEGIN
      RETURN VehicleType;
   END;
   MEMBER FUNCTION get_age_vehicle RETURN NUMBER IS
   BEGIN
      RETURN AgeOfVehicle;
   END;

   MEMBER FUNCTION get_engine_capacity RETURN NUMBER IS
   BEGIN
      RETURN Engine_Capacity;
   END;


   MEMBER FUNCTION get_lefthand_driver RETURN VARCHAR2 IS
   BEGIN
      RETURN LeftHandDriver;
   END;

   MEMBER FUNCTION get_propuslion_code RETURN VARCHAR2 IS
   BEGIN
      RETURN PropulsionCode;
   END;

   MEMBER FUNCTION get_id_driver RETURN NUMBER IS
   BEGIN
      RETURN ID_Driver;
   END;

 END;
 /
show errors;


-- CREATION DE VEHICLE_TAB POUR LE TYPE VEHICLE
CREATE TABLE vehicle_tab OF VEHICLE_TYPE
( CONSTRAINT PK_vehicle PRIMARY KEY (ID_Vehicle));


CREATE TABLE exceptions_vehicle (
row_id rowid,
owner varchar2(30),
vehicle_tab varchar2(30),
constraint varchar2(30) );

---- DESACTIVATION DES CONTRAINTES
ALTER TABLE vehicle_tab DISABLE CONSTRAINT PK_vehicle;


------ COPIE DE DONNEES DE LA ZONE EXTRACTION
INSERT INTO vehicle_tab(ID_Vehicle,VehicleType,AgeOfVehicle,Engine_Capacity,LeftHandDriver,PropulsionCode,ID_Driver) 
SELECT DISTINCT ID_Vehicle,VehicleType,AgeOfVehicle,Engine_Capacity,LeftHandDriver,PropulsionCode,ID_Driver FROM vehicle;


----- REACTIVATION DES CONTRAINTES
ALTER TABLE vehicle_tab ENABLE CONSTRAINT PK_vehicle;

EXCEPTIONS INTO exceptions_vehicle;
SELECT * FROM vehicle_tab WHERE rowid IN (SELECT row_id FROM exceptions_vehicle);


