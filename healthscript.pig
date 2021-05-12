
REGISTER /home/gopalkrishna/INSTALL/hbase-0.98.4-hadoop2/lib/zookeeper-3.4.6.jar;
REGISTER /home/gopalkrishna/INSTALL/hbase-0.98.4-hadoop2/lib/guava-12.0.1.jar;
REGISTER /home/gopalkrishna/INSTALL/hbase-0.98.4-hadoop2/lib/protobuf-java-2.5.0.jar;
REGISTER /home/gopalkrishna/INSTALL/hbase-0.98.4-hadoop2/lib/hbase-common-0.98.4-hadoop2.jar;
REGISTER /home/gopalkrishna/INSTALL/hbase-0.98.4-hadoop2/lib/hbase-client-0.98.4-hadoop2.jar;
REGISTER /home/gopalkrishna/INSTALL/hbase-0.98.4-hadoop2/lib/hbase-server-0.98.4-hadoop2.jar;

set pig.output.lazy true;


A = LOAD '/{$mr_output_path}{$timeStamp}/*' using PigStorage as ($pig_inputschema);
B = distinct A;
C = group B by $GroupbyColumnName PARALLEL $NoOfReducers;

D = foreach C {
             filterData = filter B BY page>20 and page<55;
             topData = limit filterData $limitCount;
             orderData = ORDER topData BY $OrderbyColumnName;
	     GENERATE FLATTEN(orderData);
};

Store D INTO '/$pig_output_path';

STORE D INTO 'hbase://health_hbasetab' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('p:name,p:page,p:pgender,p:disinfo,p:phospital,p:adate,p:ploc');


















