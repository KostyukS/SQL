CREATE TABLE IF NOT EXISTS Genre(
     id serial PRIMARY KEY,
     name varchar(40) NOT NULL
);


CREATE TABLE IF NOT EXISTS executor(
     id serial PRIMARY KEY,
     name varchar(40) NOT NULL
     
);

CREATE TABLE IF NOT EXISTS album(
     id serial PRIMARY KEY,
     name varchar(40) NOT NULL,
     year_of_issure integer check(year_of_issure>1960 AND year_of_issure<2100)     
);

CREATE TABLE IF NOT EXISTS List_track(
     id serial PRIMARY KEY,
     name varchar(40) NOT NULL,
     album_id integer REFERENCES album(id),
     duration integer check(duration>0)
);


CREATE TABLE IF NOT exists compilation(
     id serial primary key,
     name varchar(40) not null,
     year_of_issure integer check(year_of_issure>1960 AND year_of_issure<2100) 
);


CREATE TABLE IF NOT exists track_compilation(
     List_track_id integer references List_track(id),
     compilation_id integer references compilation(id),
     constraint tr_comp primary key (List_track_id, compilation_id) 
);


create table if not exists album_executor(
    album_id INTEGER references album(id),
    executor_id integer references executor(id),
    constraint al_ex primary key (album_id, executor_id)
);


create table if not exists executor_Genre(
    executor_id integer references executor(id),
    genre_id integer references Genre(id),
    constraint ex_genr primary key (executor_id, genre_id)
);
