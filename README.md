# Hadoop Use Case on Healthcare

## HEALTH CARE PROCESSING 

### Deployment Guide
###### System Requirements :  
4 GB RAM
20  GB HDD
UBUNTU 14.04 LTS
###### S/w Requirements :  
Java 1.8
Hadoop 2.6.0
Pig 0.15.0
Hive 1.2.1
Hbase 0.98.4 hadoop2
MySQL Database
SQOOP 1.4.6
             
### Architecture

 ![Screenshot (13)](https://user-images.githubusercontent.com/76902488/117965943-f84ce580-b340-11eb-9288-8dfb2b11956f.png)
 
##### The Deployment of the Project involves the following steps :

###### STEP 1: Install the compatible version of Hbase (0.98.4-hadoop2) on machine & update the location of bin path of the same in the .bashrc file.
###### STEP 2 : Add the following list of jars in the following directory path :
(a)	/home/user/INSTALL/hadoop-2.6.0/lib
(b)	/home/user/INSTALL/hadoop-2.6.0/share/hadoop/common
1.	commons-logging-1.1.1
2.	fontbox-1.8.10
3.	hadoop-common-2.6.0
4.	hadoop-mapreduce-client-core-2.6.0
5.	hadoop-mapreduce-examples-2.6.0
6.	jempbox-1.8.10
7.	pdfbox-1.8.10
8.	pdfbox-app-1.8.10
9.	preflight-1.8.10
10.	preflight-app-1.8.10
11.	xmpbox-1.8.10
###### STEP 3: Create a directory with name ‘project_media’ in the following path :
/home/user and place the following files,
1.	connectiondetails.txt
2.	healthcareprocessing.sh
3.	copyToHdfs.sh
4.	mapreduce.sh
5.	healthscript.pig
6.	pig.sh
7.	hive.hql
8.	hive.sh
9.	hbase.sh
10.	hbase2.sh
11.	mysql
12.	mysql.sql
13.	mysql1.sh
14.	sqoop.sh
15.	INPUTDATA.pdf
16.	parameter.properties
17.	HealthCare.jar(runnable jar)

###### STEP 4 : Execute the HealthCareProjectExecution.sh shellscript :
	       sh healthcareprocessing.sh


--Load unprocessed data(PDF) from LFS to HDFS

--To process Input data(unprocessed data) use Hadoop components like MAPREDUCE.

--Filter MR-Output in PIG
  Mapper output is loaded into PIG.
  Filtering the duplicates by using DISTINCT.
  Grouping the data based on HospitalName.
  Take top 50 Records from Hospital whose age is between 20, 55
  Sort the Unique data based on PatientID.

--Processed data will be stored in  MySQL and Hbase,Hive Tables.
  MYSQL table is created.
  Exported the Pig OutPut data to MYSQL with the help of SQOOP component
  Create a HIVE external table.
  Load PIG output data into it  for Adhoc Query Processing.

##### sample output

![Screenshot (14)](https://user-images.githubusercontent.com/76902488/117967758-10bdff80-b343-11eb-9e9b-ce6f0e8ea1d0.png)
