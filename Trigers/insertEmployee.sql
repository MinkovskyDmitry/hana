CREATE TRIGGER "DEV"."InsertEmployee"
BEFORE INSERT ON "dev.Magaz.Tables::Employee"
REFERENCING NEW ROW new_employee
FOR EACH ROW
BEGIN
    
    DECLARE employee_bithday_in_future condition for SQL_ERROR_CODE 19999;
    
    IF (current_date < :new_employee."Birthday") THEN
    	signal employee_bithday_in_future SET MESSAGE_TEXT = 'Birthday can not be if future';
    END IF;
    

END