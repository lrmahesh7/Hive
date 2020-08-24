use top10movie;


drop table moviedata;
drop table ratingdata;

CREATE TABLE moviedata (
MovieID INT,
Title STRING,
Genres STRING )
ROW FORMAT SERDE "org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe"
WITH SERDEPROPERTIES('field.delim'='::')
STORED AS TEXTFILE;


CREATE TABLE ratingdata (
UserID INT,
MovieID INT,
Ratings INT,
RatingTS INT )
ROW FORMAT SERDE "org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe"
WITH SERDEPROPERTIES('field.delim'='::')
STORED AS TEXTFILE;add jar /home/hduser/apache-hive-1.2.1-bin/lib/hive-contrib-1.2.1.jar;

load data local inpath '/home/hduser/mahesh/top10movieinput/movies.dat' into table moviedata;
load data local inpath '/home/hduser/mahesh/top10movieinput/ratings.dat' into table ratingdata;
select * from  moviedata limit 10;
select * from ratingdata limit 10;

select substring(from_unixtime(ratingts),1,4) ratingyear,title,avg(ratings)avg_rating from moviedata join ratingdata on moviedata.movieid=ratingdata.movieid group by substring(from_unixtime(ratingts),1,4),title limit 10;

select title,ratingyear,rank() over(partition by ratingyear order by avg_rating desc) rnk from (select substring(from_unixtime(ratingts),1,4)ratingyear,title,avg(ratings) avg_rating from moviedata join ratingdata on moviedata.movieid=ratingdata.movieid group by substring(from_unixtime(ratingts),1,4),title)q1 limit 10;

select * from (select title,ratingyear,rank() over (partition by ratingyear order by avg_rating desc)rnk from(select substring(from_unixtime(ratingts),1,4) ratingyear,title,avg(ratings)avg_rating from moviedata join ratingdata on moviedata.movieid=ratingdata.movieid group by substring(from_unixtime(ratingts),1,4),title)q1)q2 where rnk<=10 order by ratingyear ,rnk;


