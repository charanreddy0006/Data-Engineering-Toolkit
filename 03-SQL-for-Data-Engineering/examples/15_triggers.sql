CREATE OR REPLACE FUNCTION vehicle_insert_log()

RETURNS TRIGGER

AS $$

BEGIN

RAISE NOTICE 'Vehicle Inserted Successfully';

RETURN NEW;

END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_vehicle_insert

AFTER INSERT

ON Vehicles

FOR EACH ROW

EXECUTE FUNCTION vehicle_insert_log();