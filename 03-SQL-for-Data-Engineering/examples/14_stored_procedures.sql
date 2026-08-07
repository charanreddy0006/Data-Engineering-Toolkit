CREATE OR REPLACE FUNCTION total_vehicles()

RETURNS INTEGER

AS $$

DECLARE

count_vehicle INTEGER;

BEGIN

SELECT COUNT(*)

INTO count_vehicle

FROM Vehicles;

RETURN count_vehicle;

END;

$$ LANGUAGE plpgsql;

SELECT total_vehicles();