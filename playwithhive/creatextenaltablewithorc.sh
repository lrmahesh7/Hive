
DROP TABLE IF EXISTS User_ORC;
 
CREATE EXTERNAL TABLE User_ORC(
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	company_name VARCHAR(64),
	address STRUCT<zip:INT, street:STRING>,
	country VARCHAR(64),
	city VARCHAR(32),
	state VARCHAR(32),
	post INT,
	phone_nos ARRAY<STRING>,
	mail MAP<STRING, STRING>,
	web_address VARCHAR(64)
	)
	COMMENT 'Temporary ORC table for testing purpose'
	STORED AS ORC
	LOCATION '/user/hive/orc/user'
   	TBLPROPERTIES ("orc.compress"="SNAPPY");
 

