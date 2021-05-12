
set hive.cli.print.current.db=true;

DROP DATABASE IF EXISTS healthcare CASCADE;
create database IF NOT EXISTS healthcare ;
use healthcare;
!echo ******************************************************************************************************;
!echo ========================= THIS IS HIVE EXTERNAL TABLE FOR PIG-OUTPUT======================================;
!echo *******************************************************************************************************;

create external table Healthhive(pid int,pname string,page int,pgender string,pdisinfo string,phospital string,padate string,ploc string)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as textfile location '/Health-Pig-OUt';


