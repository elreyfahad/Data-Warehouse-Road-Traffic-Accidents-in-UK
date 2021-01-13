
CREATE TABLE DW_ACCIDENT (
   ID_Accident NUMBER(10) PRIMARY KEY,
   AccidentIndex VARCHAR2(100),
   NumberOfVehicles NUMBER(10),
   NumberOfCasualties NUMBER(10),
   ID_LOCATION NUMBER(10) CONSTRAINT FK_LOCATION REFERENCES DW_LOCATION(ID_LOCATION) ,
   ID_DATE NUMBER(10) CONSTRAINT FK_DATE REFERENCES DW_DATE(ID_DATE),
   ID_WEATHER NUMBER(10) CONSTRAINT FK_WEATHER REFERENCES DW_WEATHER(ID_WEATHER),
   ID_Vehicle NUMBER(10) CONSTRAINT FK_VEHICLE REFERENCES DW_VEHICLE(ID_Vehicle),
   ID_Driver NUMBER(10) CONSTRAINT FK_DRIVER REFERENCES DW_DRIVER(ID_Driver),
   ID_Casuality NUMBER(10) CONSTRAINT FK_CASUALTY REFERENCES DW_CASUALTY(ID_Casuality)
   );




----CREATION D'UN TRIGGER ET D'UNE SEQUENCE POUR AUTO-INCREMENTER LA CLE PRIMAIRE DW_LOCATION,DW_DATE,ET DW_WEATHER
CREATE SEQUENCE SEQUENCE_DW_ACCIDENT START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TRIGGER_ACCIDENT
BEFORE INSERT ON DW_ACCIDENT 
FOR EACH ROW
DECLARE
Next NUMBER(10);
BEGIN
   Next:=SEQUENCE_DW_ACCIDENT.nextval;
   SELECT Next into :new.ID_LOCATION from DUAL;
   SELECT Next into :new.ID_DATE from DUAL;
   SELECT Next into :new.ID_WEATHER from DUAL;
END;
/

          
-- REMPLISSAGE DE LA TABLE DE FAIT
INSERT INTO DW_ACCIDENT(ID_Accident,AccidentIndex,NumberOfVehicles,NumberOfCasualties,ID_Vehicle,ID_Casuality,ID_Driver)
SELECT DISTINCT a.get_id_accident(),a.get_accident_index(),a.get_number_vehicle(),a.get_number_casualty(),a.get_id_vehicle(),a.get_id_casualty(),v.get_id_driver()         
FROM accident_tab a,Vehicle_tab v
WHERE a.get_id_vehicle() IN (SELECT ID_Vehicle FROM Vehicle_tab) AND a.get_id_casualty() IN (SELECT ID_Casuality FROM Casualty_tab) 
AND v.get_id_driver() IN (SELECT ID_Driver FROM Vehicle_tab WHERE ID_Vehicle=a.get_id_vehicle()); 

