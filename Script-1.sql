select g."name" , count(eg.executor_id)
from genre g 
left join executor_genre eg on g.id = eg.genre_id 
group by g."name"
order by count(eg.executor_id) desc;

select count(lt."name") as count_of_tracks_2008_2016_years
from list_track lt 
left join album a on lt.album_id  = a.id 
where (a.year_of_issure >= 2008) and (a.year_of_issure <= 2016);

select a."name" , avg(lt.duration)
from album a 
left join list_track lt ON a.id = lt.album_id 
group by a."name" 
order by avg(lt.duration);

select distinct  e."name" 
from executor e 
left join album_executor ae on e.id  = ae.executor_id 
left join album a on ae.album_id = a.id 
where not a.year_of_issure = 2020;

select c."name", e."name" 
from compilation c  
left join track_compilation tc  on c.id = tc.compilation_id 
left join list_track lt on tc.list_track_id = lt.id 
left join album_executor ae on lt.album_id = ae.album_id 
left join executor e on ae.executor_id = e.id 
where e."name" like '%Хелависа%';

select a."name"
from album as a
left join album_executor ae on a.id = ae.album_id
left join executor e  on e.id = ae.executor_id 
left join executor_genre eg  on e.id = eg.executor_id 
left join genre g  on g.id = eg.genre_id 
group by a."name"
having count(distinct g."name") > 1
order by a."name"

select list_track."name" 
from list_track 
left join track_compilation tc on list_track.id = tc.list_track_id 
where tc.list_track_id  is null

select e."name" , lt.duration 
from list_track lt 
left join album a on a.id = lt.album_id 
left join album_executor ae  on ae.album_id  = a.id
left join executor e  on e.id = ae.executor_id 
group by e."name" , lt."duration" 
having lt."duration"  = (select min(duration) from list_track )
order by e."name" 

select distinct a."name" 
from album as a
left join list_track lt on lt.album_id = a.id
where lt.album_id in (
    select album_id
    from list_track
    group by album_id
    having count(id) = (
        select count(id)
        from list_track lt 
        group by album_id
        order by count
        limit 1
    )
)
order by a."name" 