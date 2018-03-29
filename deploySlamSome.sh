#!/bin/bash
# ----------------------------------------------------------------------
# version:      1.0
# createTime:   2018-03-29
# description:  发布Qt程序slamSome,根据main.cpp中的版本号，将exec文件拷贝到带版本号的文件夹中，最后压缩
# author:       fake
# ----------------------------------------------------------------------

template_deploy_dir=slamSome
release_exec_dir=~/workspace/build-SlamOptimizer-Desktop_Qt_5_9_3_GCC_64bit-Release/src
release_exec_name=some
main_cpp_dir=~/workspace/sros_photoshop/src

version_num=`grep -oP 'V\d{2}\.\d{2}\.\d2' "${main_cpp_dir}/main.cpp"`

echo current version number is $version_num

deploy_dir=slamSome$version_num

echo current deploy directory is $deploy_dir

if [ -d $deploy_dir ]
then
		rm -r $deploy_dir
		echo "rm -r $deploy_dir"		
fi

cp $template_deploy_dir $deploy_dir -r
echo "cp $template_deploy_dir $deploy_dir -r"

cp $release_exec_dir/$release_exec_name $deploy_dir
echo "cp $release_exec_dir/$release_exec_name $deploy_dir"

deploy_gzip=${deploy_dir}.tar.gz
tar -zcf $deploy_gzip $deploy_dir
echo "tar -zcf $deploy_gzip $deploy_dir"

echo finish!


