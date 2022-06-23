select name, year_of_issure from album
where year_of_issure = 2016;

select name, duration from list_track
order by duration desc
limit 1;

select name from list_track
where duration >= 210;

select name from compilation
where (2018 <= year_of_issure) and (year_of_issure <= 2020);

select name from executor
where not name like '%% %%';

select name from list_track
where name like '%%î%%';