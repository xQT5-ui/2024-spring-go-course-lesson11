-- топ 3 пользователей у которых больше всех активных датчиков
select
    *
from
    go_course_db.users
where
    id in (
        select
            t1.id
        from
            go_course_db.users t1
            join go_course_db.sensors_users t2
                on t2.user_id = t1.id
            join go_course_db.sensors t3
                on t3.id = t2.sensor_id
                and t3.is_active = 'Y'
        group by
            t1.id
        order by
            count(t2.id) desc
        limit 3
    )