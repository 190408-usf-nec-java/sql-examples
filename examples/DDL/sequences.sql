create sequence my_sequence;

select nextval('my_sequence');

create sequence my_Custom_sequence
	increment by -2
	minvalue 1000
	maxvalue 1025
	start 1010
	cache 1
	cycle;
	
select nextval('my_custom_sequence');