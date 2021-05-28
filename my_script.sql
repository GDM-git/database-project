--port: 5433 ; pswd:123g321j ; user = postgres ; db_name = postgres ; server = PostgreSQL 12

drop table if exists objects_in_storages cascade;
drop table if exists workers;
drop table if exists trucks cascade;
drop table if exists objects cascade;
drop table if exists storages;

create table storages(
	id_storage		integer		primary key,
	capacity		real,
	address_street 	varchar,
	address_house	integer
);
create table objects(
	id_object		integer		primary key,
	name_object		varchar,
	volume 			real,
	mass			real,
	fragility		boolean,
	explosion		boolean,
	toxicity		boolean
);
create table trucks(
	id_truck		integer		primary key,
	id_storage 		integer,
	foreign key (id_storage) references storages (id_storage),
	busy			boolean,
	model 			varchar,
	capacity		real,
	load_capacity	real
);
create table workers(
	id_worker 		integer		primary key,
	id_storage 		integer,
	foreign key (id_storage) references storages (id_storage),
	first_name		varchar,
	last_name		varchar,
	post			varchar,
	phone_number	varchar
);
create table objects_in_storages(
	id_storage 		integer,
	foreign key (id_storage) references storages (id_storage),
	id_object 		integer,
	foreign key (id_object) references objects (id_object),
	date_	 		date,
	number_objects	integer,
	date_mode		varchar,
	id_worker		int,
	foreign key (id_worker) references workers (id_worker),
	primary key (id_storage, id_object, date_)
);

insert into storages values
	(1, 1000, 'Koptuga', 16),
	(2, 1500, 'Kosmonavtov', 8),
	(3, 3000, 'Lenina', 64);
insert into objects values
	(1, 'nails', 0.125, 100, false, false, false),
	(2, 'wood boards', 0.0225, 10, false, false, false),
	(3, 'cement', 0.0385, 50, false, false, false),
	(4, 'white paint', 0.001, 1, false, false, false),
	(5, 'laminate', 0.0005, 0.7, false, false, false),
	(6, 'pvc tiles', 0.06, 20, false, false, false),
	(7, 'chipboard', 0.125, 10, false, false, false),
	(8, 'fiberboard', 0.125, 10, false, false, false);
insert into trucks values
	(1, 3, false, 'Mazda Titan', 52.5, 2500),
	(2, 1, false, 'Gazel', 45, 1350),
	(3, 2, false, 'Gazel', 40, 1250);
insert into workers values
	(1, 1, 'Ivanov', 'Egor', 'loader', '7954-638-37-44'),
	(2, 2, 'Kononov', 'Oleg', 'driver', '7954-258-27-99'),
	(3, 3, 'Alexeev', 'Ruslan', 'driver', '7954-754-23-34'),
	(4, 1, 'Kalashnikov', 'Andrei', 'driver', '7555-258-27-34'),
	(5, 2, 'Senkov', 'Pavel', 'driver', '7924-258-27-66'),
	(6, 3, 'Popov', 'Sergei', 'loader', '7954-321-27-34'),
	(7, 1, 'Cherenkov', 'Daniil', 'loader', '7954-278-27-34'),
	(8, 2, 'Simonov', 'Oleg', 'loader', '7954-218-27-34'),
	(9, 3, 'Kirov', 'Georg', 'driver', '7954-298-27-34'),
	(10, 1, 'Uru', 'Uru', 'loader', '7958-258-27-34'),
	(11, 2, 'Lich', 'Konstantin', 'loader', '7957-258-27-34'),
	(12, 3, 'Novikov', 'Evgenii', 'driver', '7956-258-27-34'),
	(13, 1, 'Kuznecov', 'Leonid', 'driver', '7955-258-27-34'),
	(14, 2, 'Voitov', 'Daniil', 'loader', '7954-212-27-24');
insert into objects_in_storages values
	(1, 1, '2021-03-11', 1, 'recv', 1),
	(2, 2, '2021-03-12', 2, 'recv', 2),
	(3, 3, '2021-03-13', 3, 'recv', 3),
	(1, 4, '2021-03-14', 4, 'recv', 4),
	(2, 5, '2021-03-15', 1, 'recv', 5),
	(3, 6, '2021-03-16', 2, 'recv', 6),
	(1, 7, '2021-03-17', 3, 'recv', 14),
	(2, 8, '2021-03-18', 4, 'recv', 8),
	(3, 1, '2021-03-19', 1, 'recv', 9),
	(1, 2, '2021-03-20', 2, 'recv', 10),
	(2, 3, '2021-03-21', 3, 'recv', 11),
	(3, 4, '2021-03-22', 4, 'recv', 12),
	(1, 5, '2021-03-23', 1, 'recv', 13),
	(2, 6, '2021-03-24', 2, 'recv', 14),
	(3, 7, '2021-03-25', 3, 'recv', 1),
	(1, 8, '2021-03-26', 4, 'recv', 2),
	(2, 1, '2021-04-01', 1, 'recv', 3),
	(3, 2, '2021-04-02', 2, 'recv', 4),
	(1, 3, '2021-04-03', 3, 'recv', 5),
	(2, 4, '2021-04-04', 4, 'recv', 6),
	(3, 5, '2021-04-05', 1, 'recv', 14),	
	(1, 1, '2021-06-01', 1, 'send', 8),
	(2, 2, '2021-06-02', 2, 'send', 9),
	(3, 3, '2021-06-03', 3, 'send', 10),
	(1, 4, '2021-06-04', 4, 'send', 11),
	(2, 5, '2021-06-05', 1, 'send', 12),
	(3, 6, '2021-06-06', 2, 'send', 13),
	(1, 7, '2021-06-07', 3, 'send', 14),
	(2, 8, '2021-06-08', 4, 'send', 1),
	(3, 1, '2021-06-09', 1, 'send', 2),
	(1, 2, '2021-06-10', 2, 'send', 3),
	(2, 3, '2021-06-11', 3, 'send', 4),
	(3, 4, '2021-06-12', 4, 'send', 5),
	(1, 5, '2021-06-13', 1, 'send', 6),
	(2, 6, '2021-06-14', 2, 'send', 14),
	(3, 7, '2021-06-15', 3, 'send', 8),
	(1, 8, '2021-06-16', 4, 'send', 9),
	(2, 1, '2021-06-17', 1, 'send', 10),
	(3, 2, '2021-06-18', 2, 'send', 11),
	(1, 3, '2021-06-19', 3, 'send', 12),
	(2, 4, '2021-06-20', 4, 'send', 13),
	(3, 5, '2021-06-21', 1, 'send', 14);

-------------------------------------------------------------------------------------------------
--забрать служебный грузовик
create or replace function truck_busy (id_in int) returns setof trucks as $$
begin 
	if exists (select * from trucks where id_truck = id_in) then
		update trucks set busy = true where id_truck = id_in;
		return QUERY
			select * from trucks where not busy;
	end if;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--вернуть грузовик
create or replace function truck_free (id_in int) returns setof trucks as $$
begin 
	if exists (select * from trucks where id_truck = id_in) then
		update trucks set busy = false where id_truck = id_in;
		return QUERY
			select * from trucks where not busy;
	end if;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--узнать, есть ли в наличии свободные грузовики
create or replace function free_trucks_exists () returns setof trucks as $$
begin 
	return QUERY
		select * from trucks where not busy;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--узнать, есть ли у данного работника в данный день какая-то работа
create or replace function work_date_exist (id_in int, date_in date) returns setof objects_in_storages as $$
begin 
	return QUERY
		select * from objects_in_storages where id_worker = id_in and objects_in_storages.date_ = date_in;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--узнать, есть ли у данного работника какая-то работа
create or replace function work_exist (id_in int) returns setof objects_in_storages as $$
begin 
	return QUERY
		select * from objects_in_storages where id_worker = id_in;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--посмотреть на объект с заданным id
create or replace function view_object (id_in int) returns setof objects as $$
begin 
	return QUERY
		select * from objects where id_object = id_in;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--посмотреть на объект с заданным id из таблицы связи
create or replace function view_object_link (id_in int) returns setof objects_in_storages as $$
begin 
	return QUERY
		select * from objects_in_storages where id_object = id_in;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------
--посмотреть на объекты
create or replace function view_object_all () returns setof objects as $$
begin 
	return QUERY
		select * from objects;
end
$$ language plpgsql;

-------------------------------------------------------------------------------------------------







