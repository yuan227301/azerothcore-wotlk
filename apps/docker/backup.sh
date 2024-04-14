#!/bin/bash

# MySQL数据库信息
DB_USER="root"
DB_PASS="Asma8WRRs3p7lsKfAXZx"
DB_NAMEA="acore_auth"
DB_NAMEC="acore_characters"
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_DIR="/path/to/backup/directory"

# 创建备份目录（如果不存在）
mkdir -p $BACKUP_DIR

# 备份数据库
mysqldump -u$DB_USER -p$DB_PASS $DB_NAMEC > $BACKUP_DIR/$DB_NAMEC-$DATE.sql
mysqldump -u$DB_USER -p$DB_PASS $DB_NAMEA > $BACKUP_DIR/$DB_NAMEA-$DATE.sql

# 如果备份成功，则删除过期的备份（假设你只想保留最近7天的备份）
if [ $? -eq 0 ]; then
    find $BACKUP_DIR -type f -name "$DB_NAMEC-*.sql" -mtime +7 -exec rm {} \;
fi

# 如果备份成功，则删除过期的备份（假设你只想保留最近7天的备份）
if [ $? -eq 0 ]; then
    find $BACKUP_DIR -type f -name "$DB_NAMEA-*.sql" -mtime +7 -exec rm {} \;
fi