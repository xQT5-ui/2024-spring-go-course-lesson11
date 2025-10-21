-- число активныx датчиков
select
    count(id) as nm
from
    go_course_db.sensors
where
    is_active = 'Y'