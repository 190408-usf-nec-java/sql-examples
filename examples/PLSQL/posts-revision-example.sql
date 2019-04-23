create table post_history (
	id SERIAL primary key,
	post_id INTEGER references posts(id) not null,
	content VARCHAR(255) not null,
	post_time TIMESTAMP not null,
	edit_time TIMESTAMP not null
);

create or replace function add_post_history()
	returns trigger as $$
		begin
			
			-- If this function is called by an UPDATE statement
			IF(TG_OP = 'UPDATE') then
				insert into post_history (post_id, content, post_time, edit_time)
				values (old.id, old.content, old.post_time, CURRENT_TIMESTAMP);
			end if;
		return new;
	end;
	$$ security definer language plpgsql;
	
create trigger post_revision_trigger
	before update on posts
	for each row
	execute procedure add_post_history();
	
select * from post_history;
insert into posts (author_id, content) values (3, 'helol everoyne');

update POSTS set content = 'hello everyone' where id = 1002;
select * from posts order by id desc limit 1;