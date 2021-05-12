. /home/gopalkrishna/HealthCare/parameter

hdfs dfs -test -d "/$pig_output_path"
if [ $? -eq 0 ] 
	then
	echo "**********************************************************************"
	echo "      Pig output already exists. Deleting and executing the pig script "
	echo "**********************************************************************"
	hdfs dfs -rm -r "/$pig_output_path"
fi
echo "***********************************************************************"
echo "       Pig Execution started                                           "
echo "**********************************************************************"
sh hbase.sh
pig -param_file parameter healthscript.pig



