

--       SQL CODES OF THE ORGANIZATION PERFORMING VARIOUS TYPES OF ENGINEERING WORK



-- the first thing we do is create a database called an organization

create database organization

-- We will create a table in our database called services,
-- the table will contain the id, name, duration, unit, price columns of services

create table service (
	id serial primary key not null,
	name varchar(60) not null,
	duration float not null,
	unit float not null,
	price float null
)

-- we will create a table called position, 
-- in which the title of the workers will be the coefficient of the monthly salary

create table position (
	id serial primary key not null,
	title varchar not null,
	coefficient float not null
)

-- create table min_salary

create table min_salary(
	id serial primary key not null,
	salary integer not null
)


-- we create a team table that calculates the wages of workers who work on a given order,
-- which will be linked to the service and position tables

create table team (
	id serial primary key not null,
	service_id integer references service(id),
	position_id integer references position(id)
)

alter table team add column min_salary_id integer references min_salary(id)

-- we create a table of used tools according to the given order,
-- the table will contain the name of the tools, depreciation, price

create table tools (
	id serial primary key not null,
	name varchar not null,
	depreciation integer not null,
	price integer not null
)

-- create a table of service_tools,
-- which calculates the depreciation of all equipment used on a given order,
-- the table will depend on the service and tools tables

create table service_tools (
	id serial primary key not null,
	service_id integer references service(id),
	tools_id integer references tools(id)
)

-- we create a table of consumables according to the given order, 
-- the table will contain the name of the product, unit quantity, price

create table product (
	id serial primary key not null,
	name varchar not null,
	unit_quantity integer not null,
	price integer not null
)

-- We will create a service_product table 
-- that calculates the total cost of products consumed on a given order,
-- the table will be linked to the service and product tables

create table service_product (
	id serial primary key not null,
	service_id integer references service(id),
	product_id integer references product(id),
	product_quantity integer not null
)

-- we create a schedule of customers ordering the organization

create table customer (
	id serial primary key not null,
	name varchar not null
)

-- we create a contract table 
-- that counts all orders placed by the customer, 
-- the table will depend on the customer table

create table contract (
	id serial primary key not null,
	customer_id integer references customer(id)
)

-- we create an order table that counts each order stated by the customer, 
-- the table will depend on the service, contract tables

create table orders (
	id serial primary key not null,
	contract_id integer references contract(id),
	service_id integer references service(id),
	service_size integer not null
)

-- we assign a value to each table column

insert into service (name, duration, unit) values ('qumsuvoq', 0.4, 1);
insert into service (name, duration, unit) values ('yer qazish', 2, 1);
insert into service (name, duration, unit) values ('gisht terish', 1, 1);
insert into service (name, duration, unit) values ('remont qilish', 1, 1);
insert into service (name, duration, unit) values ('beton quyish', 1, 1);

insert into position (title, coefficient) values ('usta', 1.5);
insert into position (title, coefficient) values ('yordam1', 1.3);
insert into position (title, coefficient) values ('yordam2', 1.2);
insert into position (title, coefficient) values ('usta2', 1.6);
insert into position (title, coefficient) values ('usta3', 1.8);
insert into position (title, coefficient) values ('yordam3', 1);

insert into min_salary (salary) values (800000)

insert into team (service_id, position_id, min_salary_id) values (1, 1, 1);
insert into team (service_id, position_id, min_salary_id) values (1, 2, 1);
insert into team (service_id, position_id, min_salary_id) values (2, 3, 1);
insert into team (service_id, position_id, min_salary_id) values (2, 6, 1);
insert into team (service_id, position_id, min_salary_id) values (3, 4, 1);
insert into team (service_id, position_id, min_salary_id) values (3, 6, 1);
insert into team (service_id, position_id, min_salary_id) values (3, 2, 1);
insert into team (service_id, position_id, min_salary_id) values (4, 4, 1);
insert into team (service_id, position_id, min_salary_id) values (5, 2, 1);
insert into team (service_id, position_id, min_salary_id) values (5, 3, 1);
insert into team (service_id, position_id, min_salary_id) values (5, 6, 1);


insert into tools (name, depreciation, price) values ('kran', 20, 1000000);
insert into tools (name, depreciation, price) values ('lopata', 200, 15000);
insert into tools (name, depreciation, price) values ('chelak', 200, 16000);

insert into service_tools (service_id, tools_id) values (1, 2);
insert into service_tools (service_id, tools_id) values (1, 3);
insert into service_tools (service_id, tools_id) values (2, 1);
insert into service_tools (service_id, tools_id) values (3, 3);
insert into service_tools (service_id, tools_id) values (4, 3);
insert into service_tools (service_id, tools_id) values (5, 2);
insert into service_tools (service_id, tools_id) values (5, 3);

insert into product (name, unit_quantity, price) values ('qum', 1, 50000);
insert into product (name, unit_quantity, price) values ('shpaklyofka', 1, 8000);
insert into product (name, unit_quantity, price) values ('sement', 1, 500);
insert into product (name, unit_quantity, price) values ('gisht', 1, 200);

insert into service_product (service_id, product_id, product_quantity) values (1, 1, 2);
insert into service_product (service_id, product_id, product_quantity) values (3, 4, 3000);
insert into service_product (service_id, product_id, product_quantity) values (3, 1, 1);
insert into service_product (service_id, product_id, product_quantity) values (4, 2, 5);
insert into service_product (service_id, product_id, product_quantity) values (5, 3, 5000);
insert into service_product (service_id, product_id, product_quantity) values (5, 1, 0.5);

insert into customer (name) values ('Sardor');
insert into customer (name) values ('Javohir');

insert into contract (customer_id) values (1);
insert into contract (customer_id) values (2);
insert into contract (customer_id) values (1);

insert into orders (contract_id, service_id, service_size) values (1, 1, 10);
insert into orders (contract_id, service_id, service_size) values (1, 2, 30);
insert into orders (contract_id, service_id, service_size) values (1, 4, 5);
insert into orders (contract_id, service_id, service_size) values (2, 5, 15);
insert into orders (contract_id, service_id, service_size) values (2, 2, 20);
insert into orders (contract_id, service_id, service_size) values (3, 2, 25);
insert into orders (contract_id, service_id, service_size) values (3, 4, 40);
insert into orders (contract_id, service_id, service_size) values (3, 5, 18);

-- we add new columns to the table and delete them

alter table  service add service_size integer
alter table service drop column service_size

alter table product add product_quality varchar
alter table product drop column product_quality

-- we use truncate and rename queries

create table test(
	id serial primary key not null,
	name varchar not null
)

alter table test rename to test1
alter table test rename column name to title

-- we use the truncate query to delete all the data in the table

insert into test1 (title) values ('Doniyor')
truncate table test1
drop table test1

-- we determine how many different prices there are in the product table

select distinct price from product

-- We remove the first 2 jobs from the service table

select name from service limit 2 

-- the first customer ordered a total of several jobs

select customer.name, count("orders".service_id)
from customer join contract on "customer".id = "contract".customer_id
join orders on "contract".id = "orders".contract_id
where customer.id = 1
group by "customer".name

-- how many workers  were used for each job

select service.name, count(position_id) count_position
from service
join team on service.id = team.service_id
group by service.name
order by count_position

-- we determine how many services each tool is used for

select tools.name, count(service_id) count_service
from tools 
join service_tools on tools.id = service_tools.tools_id
group by tools.name
order by count_service

-- we will publish a list of services used by the truck

select service.name
from service
join service_tools on service.id = service_tools.service_id
join tools on service_tools.tools_id = tools.id
where tools.name = 'kran'
order by service.name

-- we calculate the total cost of the products spent on each service

select service.name, sum(product.price)
from service
join service_product on service.id = service_product.service_id
join product on service_product.product_id = product.id
group by service.name
order by service.name

-- we determine the number of customer orders whose id is equal to 1

select customer.name, count(contract.id)
from customer
join contract on customer.id = contract.customer_id
where customer.id = 1
group by customer.name

-- we create a view that contains product names that are above the average of the product prices

create view product_price
as 
select product.name, product.price
from product
where price > (
	select avg(product.price)
	from product
)
order by price desc;

-- we use this view

select  * from product_price

-- we determine the service that consumes the most products

create view count_product_service
as
select service.name, count(product_id) count_product
	from service 
	join service_product on service.id = service_product.service_id
	group by service.name
 

select name, count_product
from count_product_service
where count_product = (
	select max(count_product)
	from count_product_service
)

-- we create a view that includes the cost of all the tools used for each order

create materialized view allsum_tools_price
as

select orders.id, sum (tools.price)
from orders
join service on orders.service_id = service.id
join service_tools on service_tools.service_id = service.id
join tools on tools.id = service_tools.tools_id
group by orders.id
order by orders.id


-- now let’s check if the view we created works

update tools 
set price = 17000
where id = 3

refresh materialized view allsum_tools_price

-- create, update, drop materialized view

create or replace materialized view services
as
select service.name from service
with data

alter materialized view services rename to service_name

drop materialized view  if exists service_name

-- evaluate the cost of products

select name,
	price,
	case
		when price > 0
			and price < 5000 then 'cheap'
		when price >= 5000
			and price < 20000 then 'normal'
		when price >= 20000 then 'expensive'
	end prices
from product
order by name

-- Trigger insert tools

create or replace function calculate_service_tools
	(depreciation numeric, price numeric)
returns numeric(10, 2)
language plpgsql
as
$$
declare ret numeric(10,2) := 0;
begin
select ret = (depreciation * price) / (100 * 365 * 24);
return ret;
end
$$

create or replace function insert_service_tools()
returns trigger
language plpgsql
as
$$
declare
tools_price integer := 0;
tools_depreciation integer := 0;
begin
	select price into  tools_price 
		from tools where id = new.tools_id;
	select depreciation into tools_depreciation
		from tools where id = new.tools_id;
	update service 
		set price = price + duration * calculate_service_tools(
			tools_depreciation, tools_price
		)
	where id = new.service_id;
	return new;
end;
$$

create or replace trigger insert_service_tools_trigger
after insert
on service_tools
for each row
execute procedure insert_service_tools();

-- trigger update tools

create  or replace function update_service_tools()
returns trigger
language plpgsql
as
$$
declare
tools_price integer := 0;
tools_depreciation integer := 0;
tools_price_new integer := 0;
tools_depreciation_new integer := 0;
begin

select price into tools_price from tools 
	where id = old.tools_id;
select depreciation into tools_depreciation from tools
	where id = old.tools_id;
select price into tools_price_new from tools 
	where id = new.tools_id;
select depreciation into tools_depreciation_new from tools
	where id = new.tools_id;

update service set price = price - (duration * calculate_service_tools(tools_depreciation, tools_price))
		+(duration * calculate_service_tools(tools_depreciation_new, tools_price_new))
	where id = new.service_id;
return new;
end;
$$


create or replace trigger update_service_tools_trigger
after update
on service_tools
for each row
 execute procedure update_service_tools()


-- trigger delete tools

create or replace function delete_service_tool()
returns trigger
language plpgsql as
$$

declare
tools_price integer := 0;
tools_depreciation integer := 0;
begin
select price into tools_price from tools
where id = old.tools_id;
select depreciation into tools_depreciation from tools
where id = old.tools_id;
update service set price = price - (duration * calculate_service_tools(tools_depreciation, tools_price))
where id = old.service_id;
return old;
end;
$$


create trigger delete_service_tool_trigger 
after delete
on service_tools
for each row
execute procedure delete_service_tool()

-- trigger insert product

create or replace function insert_service_product()
returns trigger
language plpgsql
as
$$
declare
product_price integer := 0;
begin
select price into product_price from product
	where id = new.product_id;
update service 
	set price = price + product_price * new.product_quantity
	where id = new.service_id;
return new;
end
$$


create or replace trigger insert_service_product_trigger
after insert
on service_product
for each row
	execute procedure insert_service_product()

-- trigger update product

create or replace function update_service_product()
returns trigger
language plpgsql
as
$$
declare
product_price integer := 0;
product_price_new integer := 0;
begin 
select price into product_price from product
	where id = old.product_id;
select price into product_price_new from product
	where id = new.product_id;
update service set price = price - (old.product_quantity * product_price)
	+ (new.product_quantity * product_price_new)
where id = new.service_id;
return new;
end
$$

create or replace trigger update_service_product_trigger
after update
on service_product
for each row
	execute procedure update_service_product()

-- trigger delete product

create or replace function delete_service_product()
returns trigger
language plpgsql
as
$$
declare
product_price integer := 0;
begin 
select price into product_price from product
	where id = old.product_id;
update service set price = price - (old.product_quantity * product_price)
where id = old.service_id;
return old;
end
$$


 create or replace trigger update_service_product_trigger
after delete
on service_product
for each row
	execute procedure delete_service_product()


-- trigger insert position

create or replace function insert_service_position()
returns trigger
language plpgsql
as
$$
declare
position_coefficient numeric := 0;
min_salary integer := 0;
begin 
select coefficient into position_coefficient from position
	where id = new.position_id;
select salary into min_salary from min_salary 
	where id = new.min_salary_id;
update service set price = price + (
	min_salary * position_coefficient * duration / 189
)
where id = new.service_id;
return new;
end
$$


create or replace trigger insert_service_position_trigger
after insert
on team
for each row
execute procedure insert_service_position ()

-- trigger update position

create or replace function update_service_position()
returns trigger
language plpgsql
as
$$
declare
position_coefficient numeric := 0;
position_coefficient_new numeric := 0;
min_salary integer := 0;
min_salary_new integer := 0;
begin 
select coefficient into position_coefficient from position
	where id = old.position_id;
select coefficient into position_coefficient_new from position
	where id = new.position_id;
select salary into min_salary from min_salary 
	where id = old.min_salary_id;
select salary into min_salary_new from min_salary 
	where id = new.min_salary_id;
update service set price = price - (
	min_salary * position_coefficient * duration / 189)
	+ (min_salary_new * position_coefficient_new * duration / 189)
where id = new.service_id;
return new;
end
$$


create or replace trigger update_service_position_trigger
after update
on team
for each row
execute procedure update_service_position ()


-- trigger delete position


create or replace function delete_service_position()
returns trigger
language plpgsql
as
$$
declare
position_coefficient numeric := 0;
min_salary integer := 0;
begin 
select coefficient into position_coefficient from position
	where id = old.position_id;
select salary into min_salary from min_salary 
	where id = old.min_salary_id;
update service set price = price - (
	min_salary * position_coefficient * duration / 189)
where id = old.service_id;
return old;
end
$$


create or replace trigger delete_service_position_trigger
after delete
on team
for each row
execute procedure delete_service_position ()










