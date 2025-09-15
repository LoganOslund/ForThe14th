-- Trigger function
CREATE OR REPLACE FUNCTION update_status_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Status = 'delivered' THEN
        NEW.StatusDate := CURRENT_TIMESTAMP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger on Packages table
CREATE TRIGGER trg_update_status
BEFORE UPDATE OF Status ON Packages
FOR EACH ROW
EXECUTE FUNCTION update_status_trigger();
