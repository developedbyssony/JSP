use jdcprac2;
create table userinfo(
	user_id varchar(20)  primary key,
    user_pw varchar(30) not null ,
    user_name varchar(20) not null, 
    email varchar(30)
    );
    
INSERT INTO userinfo values ('aaa1111', '11111', '홍길동', 'nuck@naver.com');
INSERT INTO userinfo values ('aaa113', '11111', '홍길동', 'nuck@naver.com');
INSERT INTO userinfo (user_id, user_pw, user_name) values ('aaa211', '11111', '홍길동');

select * from userinfo;