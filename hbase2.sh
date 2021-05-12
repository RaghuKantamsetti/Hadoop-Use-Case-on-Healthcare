
echo "************************************************************************"
echo "                verfication from HBASE side                             "
echo "************************************************************************"
echo "scan 'health_hbasetab', {LIMIT => 5}"|hbase shell
echo "count 'health_hbasetab'" |hbase shell
exit |hbase shell
