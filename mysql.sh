echo "*******************************************************************************"
echo "           Creating table in Mysql Database                                    "
echo "*******************************************************************************"
mysql --user=root --password=root < mysql.sql
if [ $? -eq 0 ]
then
echo "********************************************************************************"
echo "             EMPTY TABLE with SCHEMA created successfully in mysql                           "
echo "********************************************************************************"
else
echo "Table not created successfully in mysql"
exit 
fi

