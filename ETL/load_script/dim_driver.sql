CREATE TABLE DW_DRIVER(
   ID_driver NUMBER(10) PRiMARY KEY,
   AgeBand VARCHAR2(100),
   SexDriver VARCHAR2(100)
   );

-- REMPLISSAGE DE LA TABLE DE DIMENSION

INSERT INTO DW_DRIVER SELECT d.get_id_driver(),d.get_age_band(),d.get_sex_driver() FROM driver_tab d WHERE d.get_id_driver() IN (SELECT ID_driver FROM VEHICLE_TAB);