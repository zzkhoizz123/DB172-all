#!/bin/bash

echo 'Load schema'
mysql -u $1 -p$2 < db.sql

echo 'Load sample data'
mysql -u $1 -p$2 db_online_course < sample.sql

echo 'Load functions'
mysql -u $1 -p$2 db_online_course < func.sql

echo 'Load procedures'
mysql -u $1 -p$2 db_online_course < proc.sql

echo 'Load triggers'
mysql -u $1 -p$2 db_online_course < trigger.sql