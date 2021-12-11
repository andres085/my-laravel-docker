#!/bin/bash
mysql_password=userpassword
mysql_db=db_test
mysql_user=usertest
mysql_port=3306
backup_dir="/opt/mysql/backup"

dt=$(date +'%Y%m%d_%H%M')
echo "Backup starts: $(date +"%Y-%m-%d %H:%M:%S")"


# execute the backup command:
mysqldump -hmysql-laravel -P$mysql_port -u$mysql_user -p$mysql_password $mysql_db --single-transaction --quick --lock-tables=false > $backup_dir/mysql_backup_"$dt".sql

find $backup_dir -mtime +7 -type f -name '*.sql' -exec rm -rf {} \;
echo "Backup ends: $(date +"%Y-%m-%d %H:%M:%S")"