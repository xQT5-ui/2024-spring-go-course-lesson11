-- Выведите максимальную температуру по дням для датчика c sensor_id=12 отсортированного по убыванию температуры
create index sensor_id_u1 on go_course_db.events (sensor_id);
select
    date(timestamp) as dt
    , max(payload) as max_temperature
from
    go_course_db.events
where
    sensor_id = 12
group by
	date(timestamp)
order by
   	max_temperature desc

/*
"Sort  (cost=255.96..261.95 rows=2396 width=12)"
"  Sort Key: (max(payload)) DESC"
"  ->  HashAggregate  (cost=91.52..121.47 rows=2396 width=12)"
"        Group Key: date(""timestamp"")"
"        ->  Index Scan using sensor_id_u1 on events  (cost=0.57..79.53 rows=2398 width=12)"
"              Index Cond: (sensor_id = 12)"
*/