create table List(
    title nvarchar2(50),
    userID nvarchar2(20),
    Content nvarchar2(100),
    regdate TimeStamp default sysdate
);

SELECT * FROM List;

select * from (select rownum num, L.* from (select * from List order by regdate) L)" + 
					" where num between 2 and 10;
					
					
Drop table List;