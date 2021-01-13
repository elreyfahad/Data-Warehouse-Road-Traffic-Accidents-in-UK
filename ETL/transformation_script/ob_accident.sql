CREATE OR REPLACE TYPE ACCIDENT_TYPE AS OBJECT (
   ID_Accident NUMBER(10),
   AccidentIndex VARCHAR2(100),
   NumberOfVehicles NUMBER(10),
   NumberOfCasualties NUMBER(10),
   City VARCHAR2(100),
   Urban VARCHAR2(100),
   Road VARCHAR2(100),
   Longitude VARCHAR2(100),
   Latitude VARCHAR2(100),
   DayoOfWeek VARCHAR2(100),
   DateAccident VARCHAR2(100),
   TimeAccident VARCHAR2(50),
   WeatherCondition VARCHAR2(100),
   LightCondition VARCHAR2(100),
   ID_Vehicle NUMBER(10),
   ID_Casuality NUMBER(10),
    MEMBER FUNCTION get_id_accident RETURN NUMBER,
	  MEMBER FUNCTION get_accident_index RETURN VARCHAR2,
    MEMBER FUNCTION get_number_vehicle RETURN NUMBER,
    MEMBER FUNCTION get_number_casualty RETURN NUMBER,
    MEMBER FUNCTION get_city RETURN VARCHAR2,
    MEMBER FUNCTION get_urban RETURN VARCHAR2,
    MEMBER FUNCTION get_road RETURN VARCHAR2,
    MEMBER FUNCTION get_longitude RETURN VARCHAR2,
    MEMBER FUNCTION get_latitude RETURN VARCHAR2,
    MEMBER FUNCTION get_hour_accident RETURN VARCHAR2,
    MEMBER FUNCTION get_day_week RETURN VARCHAR2,
    MEMBER FUNCTION get_date RETURN VARCHAR2,
    MEMBER FUNCTION get_month RETURN VARCHAR2,
    MEMBER FUNCTION get_year RETURN VARCHAR2,
    MEMBER FUNCTION get_weather_condition RETURN VARCHAR2,
    MEMBER FUNCTION get_light_condition RETURN VARCHAR2,
    MEMBER FUNCTION get_id_vehicle RETURN NUMBER,
    MEMBER FUNCTION get_id_casualty RETURN NUMBER
    );
/
show errors;
CREATE OR REPLACE TYPE BODY ACCIDENT_TYPE AS 
   MEMBER FUNCTION get_id_accident RETURN NUMBER IS
   BEGIN
      RETURN ID_Accident;
   END;

   MEMBER FUNCTION get_accident_index RETURN VARCHAR2 IS
   BEGIN
      RETURN AccidentIndex;
   END;

   MEMBER FUNCTION get_number_vehicle RETURN NUMBER IS
   BEGIN
      RETURN NumberOfVehicles;
   END;

   MEMBER FUNCTION get_number_casualty RETURN NUMBER IS
   BEGIN
      RETURN NumberOfCasualties;
   END;

   MEMBER FUNCTION get_city RETURN VARCHAR2 IS
   BEGIN
      RETURN City;
   END;

   MEMBER FUNCTION get_urban RETURN VARCHAR2 IS
   BEGIN
      RETURN Urban;
   END;
   MEMBER FUNCTION get_road RETURN VARCHAR2 IS
   BEGIN
      RETURN Road;
   END;
   MEMBER FUNCTION get_longitude RETURN VARCHAR2 IS
   BEGIN
      RETURN Longitude;
   END;

   MEMBER FUNCTION get_latitude RETURN VARCHAR2 IS
   BEGIN
      RETURN Latitude;
   END;

   MEMBER FUNCTION get_day_week RETURN VARCHAR2 IS
   BEGIN
       RETURN DayoOfWeek;
   END;

   MEMBER FUNCTION get_hour_accident RETURN VARCHAR2 IS
   BEGIN
       RETURN TimeAccident;
   END;


   MEMBER FUNCTION get_date RETURN VARCHAR2 IS
   BEGIN
       RETURN DateAccident;
   END;

   MEMBER FUNCTION get_year RETURN VARCHAR2 IS
   BEGIN
      RETURN EXTRACT(YEAR FROM TO_DATE(DateAccident));
   END;

   MEMBER FUNCTION get_month RETURN VARCHAR2 IS
   BEGIN
      RETURN EXTRACT(MONTH FROM TO_DATE(DateAccident));
   END;

   MEMBER FUNCTION get_weather_condition RETURN VARCHAR2 IS
   BEGIN
      RETURN WeatherCondition;
   END;

   MEMBER FUNCTION get_light_condition RETURN VARCHAR2 IS
   BEGIN
      RETURN LightCondition;
   END;

   MEMBER FUNCTION get_id_vehicle RETURN NUMBER IS
   BEGIN
      RETURN ID_Vehicle;
   END;

   MEMBER FUNCTION get_id_casualty RETURN NUMBER IS
   BEGIN
      RETURN ID_Casuality;
   END;
  
 END;
 /
show errors;


-- CREATION DE ACCIDENT_TAB POUR LE TYPE ACCIDENT
CREATE TABLE accident_tab OF ACCIDENT_TYPE
( CONSTRAINT PK_accident PRIMARY KEY (ID_Accident));
CREATE TABLE exceptions_accident(
row_id rowid,
owner varchar2(30),
accident_tab varchar2(30),
constraint varchar2(30) );

---- DESACTIVATION DES CONTRAINTES
ALTER TABLE accident_tab DISABLE CONSTRAINT PK_accident;


------ COPIE DE DONNEES DE LA ZONE EXTRACTION
INSERT INTO accident_tab(ID_Accident,AccidentIndex,NumberOfVehicles,NumberOfCasualties,City,Urban,Road,Longitude,Latitude,DayoOfWeek,DateAccident,TimeAccident,WeatherCondition,LightCondition,
ID_Vehicle,ID_Casuality) 
SELECT ID_Accident,AccidentIndex,NumberOfVehicles,NumberOfCasualties,City,Urban,Road,Longitude,Latitude,DayoOfWeek,DateAccident,TimeAccident,WeatherCondition,LightCondition,
ID_Vehicle,ID_Casuality 
FROM accident;


----- REACTIVATION DES CONTRAINTES
ALTER TABLE accident_tab ENABLE CONSTRAINT PK_accident;

EXCEPTIONS INTO exceptions_accident;
SELECT * FROM accident_tab WHERE rowid IN (SELECT row_id FROM exceptions_accident);
