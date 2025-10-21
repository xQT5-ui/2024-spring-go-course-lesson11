-- самый популярный тип датчика
select
    type
    , count(id) as nm
from
    go_course_db.sensors
group by
    type
order by
    count(id) DESC
limit 1