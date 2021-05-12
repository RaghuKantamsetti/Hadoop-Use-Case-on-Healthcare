. /home/gopalkrishna/HealthCare/parameter
#!/bin/sh
start-all.sh
mr-jobhistory-daemon.sh start historyserver
hdfs dfsadmin -safemode leave
start-hbase.sh

echo "*******************************************************************************"
echo "     ******* UPDATING THE PARAMETER FILE with current TIMESTAMP value  ********                              "
echo "*******************************************************************************"

currentTime=$(date +"%Y-%m-%d_%H-%M-%S")
sed -i '/^time/d' /home/gopalkrishna/HealthCare/parameter
echo "timeStamp=\"_"$currentTime"\"" >> /home/gopalkrishna/HealthCare/parameter


echo "*******************************************************************************"
echo "                        Copying Inputfile into Hdfs                              "
echo "*******************************************************************************"

sh copyToHdfs.sh
if [ $? -eq 0 ]
then
echo "*******************************************************************************"
echo "                         Inputfile copied to Hdfs                     "
echo "********************************************************************************"
else
echo " Inputfile not copied"
fi


echo "********************************************************************************"
echo "                        Mapreduce Processing Started                             "
echo "********************************************************************************"
sh mapreduce.sh
if [ $? -eq 0 ]
then
echo "*******************************************************************************"
echo "           	     Mapreduce Processing is completed                 "
echo "*******************************************************************************"
else
echo "Mapreduce processing stopped"
exit;
fi

echo "*******************************************************************************"
echo "           	         Pig Processing Started                                 "
echo "*******************************************************************************"

echo "*******************************************************************************"
echo "     Loading the data into hbase tables for Low Latency Access                       "
echo "*******************************************************************************"

sh pig.sh
sh hbase2.sh
if [ $? -eq 0 ]; then
echo "*******************************************************************************"
echo "           		 Pig Processing is completed                       "
echo "*******************************************************************************"
else
echo "Pig processing stopped"
exit;
fi
echo "*******************************************************************************"
echo "           Loading the data into Hive External Table for Adhoc Query Process              "
echo "*******************************************************************************"
sh hive.sh
if [ $? -eq 0 ] 
then
echo "*******************************************************************************"
echo "           		Data loaded into Hive Table                     "
echo "*******************************************************************************"
else
echo "Data not loaded into hive"
exit;
fi 

echo "*******************************************************************************"
echo "             Exporting  PIG OUTPUT to Mysql using Sqoop               "
echo "*******************************************************************************"
sh mysql.sh
sh sqoop.sh
sh mysql1.sh
if [ $? -eq 0 ]; then
echo "*******************************************************************************"
echo "               Data exported from Hdfs to mysql using sqoop          "                                      
echo "*******************************************************************************"
else
echo "Data not exported to mysql"
exit;
fi

echo "*******************************************************************************"
echo "                   	EXECUTION COMPLETED          "
echo "*******************************************************************************"









