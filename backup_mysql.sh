#!/bin/bash

#---------------------------------------------
# 这是一个备份数据的脚本，它备份了数据库表头、内容、过程
#
#------------------------------------------------


database_name='xjxx'	# 要备份数据的名字
file_name="${database_name}_backup_`date '+%Y-%m-%d %H:%M:%S'`.sql" # 备份数据的名字
#echo $file_name
workdir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd ) # 保存备份文件的文件夹
#echo $workdir
file_path="${workdir}/${file_name}"
#echo $file_path

#sqlmysqldump -u user -p password database-name > $File

mysqldump -u root -p --databases ${database_name} --single-transaction --routines --flush-logs > "${file_path}"

echo "Backup database ${database_name} seccessful! Backup name is ${file_path}"


# 导入数据库
# mysql -u root -p --one-database ${database_name} < xjxx_backup_2018-04-26\ 16\:45\:48.sql 
