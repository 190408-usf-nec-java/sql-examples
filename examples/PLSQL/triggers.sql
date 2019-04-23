CREATE TABLE IF NOT EXISTS colors (
	id SERIAL PRIMARY KEY,
	color varchar(40)
);

insert into colors (color) values
	('red'), ('black'), ('dark red'), ('green'), ('yellow'), ('yellow green'),
	('bluish red'), ('maroon'), ('pink'), ('rose'), ('fuschia'), ('blue'),
	('crimson'), ('magenta'), ('lavendar');

select * from colors;
insert into colors (color) values ('orange');

delete from colors where ID = 1;
update colors set color = 'blue' where id = 2;


























-- INSERT INTO colors (color) VALUES ('red'), ('blue'), ('green'), ('yellow'), ('orange'), 
-- 				('purple'), ('black'), ('cyan'), ('gold'), ('white'), ('grey'), ('turquoise'),
-- 				('aqua');
				
INSERT INTO colors (color) VALUES ('blue');
SELECT * FROM colors;
UPDATE colors SET color = 'blue' WHERE id = 4;




-- This content is generally hidden from trainees at first - I just have them tell me colors and let them see that
-- blue will not be inserted along with the others and ask them why this might be the case.
-- I then show them the trigger and explain how it works.
-- My experience has been that PostgreSQL students seem to have a poorer understanding of Oracle SQL students,
-- as they do not need to make triggers to accomplish incrementing column values. They should probably be given an 
-- exercise to get hands on practice creating triggers.


-- TG_OP -- Trigger Operation - Holds kind of operation data
-- NEW -- new row data, data trying to be inserted or updated to
-- OLD -- old row data, data that will be replaced or removed
CREATE OR REPLACE FUNCTION no_blues_process()
RETURNS trigger AS $$
	begin
		-- TG_OP 
		IF(TG_OP = 'INSERT') then
			-- NEW - New table data
			IF(UPPER(NEW.color) = 'BLUE') THEN
				RETURN NULL;
			END IF;
		END IF;
		IF(UPPER(NEW.color) = 'BLUE') THEN
			RETURN OLD;
			-- OLD - old table data
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER no_blues
	-- BEFORE, UPDATE, INSTEAD OF
	BEFORE INSERT OR UPDATE ON colors
	FOR EACH ROW
	EXECUTE PROCEDURE no_blues_process();
