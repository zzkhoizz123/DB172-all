#!/bin/bash

echo 'Load schema'
mysql -u $1 -p$2 < db.sql

echo 'Load triggers'
mysql -u $1 -p$2 db_online_course < trigger.sql

echo 'Load sample data'
mysql -u $1 -p$2 db_online_course < sample/user-small.sql
mysql -u $1 -p$2 db_online_course < sample/course-small.sql
mysql -u $1 -p$2 db_online_course < sample/class-small.sql
mysql -u $1 -p$2 db_online_course < sample/lesson-small.sql

echo 'Load functions'
mysql -u $1 -p$2 db_online_course < func.sql

echo 'Load procedures'
mysql -u $1 -p$2 db_online_course < proc/user.sql
mysql -u $1 -p$2 db_online_course < proc/course.sql
mysql -u $1 -p$2 db_online_course < proc/class.sql
mysql -u $1 -p$2 db_online_course < proc/lesson.sql
mysql -u $1 -p$2 db_online_course < proc/content.sql

