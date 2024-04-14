#!/bin/bash

# 设置数据库连接信息
DB_HOST="ac-database"
DB_USER="root"
DB_PASS="Asma8WRRs3p7lsKfAXZx"
DB_NAMEA="acore_auth"
DB_NAMEC="acore_characters"
BACKUP_DIR="/project/dbbackup"
DATE=$(date +%Y%m%d%H%M%S)

# 创建备份目录（如果不存在）
mkdir -p $BACKUP_DIR

# 备份数据库
docker exec $DB_HOST mysqldump -u$DB_USER -p$DB_PASS $DB_NAMEA > $BACKUP_DIR/$DB_NAMEA-$DATE.sql
docker exec $DB_HOST mysqldump -u$DB_USER -p$DB_PASS $DB_NAMEC > $BACKUP_DIR/$DB_NAMEC-$DATE.sql

find $BACKUP_DIR -type f -name "$DB_NAMEA-*.sql" -mtime +7 -exec rm {} \;
find $BACKUP_DIR -type f -name "$DB_NAMEC-*.sql" -mtime +7 -exec rm {} \;
