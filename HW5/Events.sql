
SHOW VARIABLES LIKE "event_scheduler";

-- Turn it on 

SET GLOBAL event_scheduler = ON;



-- Event which is calling CreateProductSalesStore every 1 minute in the next 1 hour

DELIMITER $$

CREATE EVENT CreateProductSalesStoreEvent
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
	BEGIN
		INSERT INTO messages SELECT CONCAT('event:',NOW());
    		CALL LoopDemo();
	END$$
DELIMITER ;

-- Listing all events stored in the schema

SHOW EVENTS;

-- Deleting an event

DROP EVENT IF EXISTS CreateProductSalesStoreEvent;

