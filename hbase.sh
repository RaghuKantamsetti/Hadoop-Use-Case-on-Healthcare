

echo "************************************************************************"
echo "                listing the tables in hbase                             "
echo "************************************************************************"
echo 'list' |hbase shell
echo "exists 'health_hbasetab'" |hbase shell
echo "disable 'health_hbasetab'" |hbase shell
echo "drop 'health_hbasetab'" |hbase shell


echo "************************************************************************"
echo "               creating the table in hbase                              "
echo "************************************************************************"
echo "create 'health_hbasetab','p'" |hbase shell

exit |hbase shell



