. /home/gopalkrishna/HealthCare/parameter

echo "*****************************************************************************"
echo "    Exporting the PIG OUTPUT to Mysql Database for Reporting            "
echo "*****************************************************************************"

sqoop export --options-file connectiondetails.txt --table $tableName -m $NoOfMappers --export-dir /Health-Pig-Out/* --fields-terminated-by '\t';


echo "*****************************************************************************"
echo "    Successfully exported PIG Output to MYSQL            "
echo "*****************************************************************************"

echo "*****************************************************************************"
echo "    checking whether data inserted or not by counting the records            "
echo "*****************************************************************************"
sqoop eval --options-file connectiondetails.txt --query "select * from $tableName LIMIT 10";
echo "*****************************************************************************"
echo "    DATA Ingested on to MYSQL COMPLETELY            "
echo "*****************************************************************************"


