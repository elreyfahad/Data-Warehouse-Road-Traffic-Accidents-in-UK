
----CREATION DE LA TABLE DE DIMENSION VEHICLE
CREATE TABLE DW_VEHICLE(
   ID_Vehicle NUMBER(10) PRIMARY KEY,
   VehicleType VARCHAR2(100),
   AgeOfVehicle NUMBER(10),
   Engine_Capacity NUMBER(10),
   LeftHandDriver VARCHAR2(20),
   PropulsionCode VARCHAR2(100)
   );



-- REMPLISSAGE DE LA TABLE           
INSERT INTO DW_VEHICLE 
SELECT v.get_id_vehicle(),v.get_vehicle_type(),v.get_age_vehicle(),v.get_engine_capacity(),v.get_lefthand_driver(),v.get_propuslion_code()
FROM vehicle_tab v;



