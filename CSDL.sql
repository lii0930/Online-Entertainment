drop database ps25732_java4
use master
create database ps25732_java4;
go
use ps25732_java4;
go
create table [user] (
	id int identity primary key,
	username varchar(20) unique not null,
	[password] varchar(10) not null,
	email varchar(100) not null,
	[admin] bit not null default 0,
	active bit not null default 1
)

create table video (
	id int identity primary key,
	title nvarchar(50) not null,
	href varchar(100) unique null,
	poster varchar(255) null,
	[view] int null,
	share int null,
	[description] nvarchar(250) null,
	active bit not null default 1
)

create table history (
	id int identity primary key,
	userId int foreign key references [user](id),
	videoId int foreign key references video(id),
	viewedDate date not null default getDate(),
	liked bit null default 0,
	likedDate date null
)