create table uploadfiles(
    userID nvarchar2(20),
    title nvarchar2(50),
    Content nvarchar2(100),
    filename nvarchar2(100),
    regdate TimeStamp default sysdate 
);


select * from uploadfiles;

Drop table uploadfiles;