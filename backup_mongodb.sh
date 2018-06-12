#!/bin/bash

#---------------------------------------------
# 这是一个备份mongodb数据的脚本，它备份了数据库表头、内容、过程
#
#------------------------------------------------

if [ $# == 1 ]
then
		message=$1
else
		echo -n "请输入备份信息："
		read message	# 备份的信息
fi

database_name='tms'	# 要备份数据的名字
dir_name="${database_name}_backup_`date '+%Y-%m-%d_%H:%M:%S'`_${message}" # 备份数据的dir
#echo $dir_name
workdir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd ) # 保存备份文件的文件夹
#echo $workdir
dir_path="${workdir}/${dir_name}"
#echo $dir_path

mongodump -h localhost -d ${database_name} -o ${dir_path}

echo "Backup database ${database_name} seccessful! Backup name is ${dir_path}"


# 导入数据库
