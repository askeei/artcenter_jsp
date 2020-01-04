drop database if exists artcenter;
create database artcenter;
use artcenter;

drop table if exists member;
create table member(
   id varchar(20) NOT NULL,
   pw text DEFAULT NULL,
   name varchar(20) DEFAULT NULL,
   sex varchar(10) DEFAULT NULL,
   phone varchar(20) DEFAULT NULL,
   type int DEFAULT '0',
   primary key(id)
);
insert into member
values("inside94", "4c4ea1e248d127717679862f032dce8e6dd5e749c7f1342c0668da9017f225bc", "안석경", "남", "010-0000-0000", 1);
insert into member
values("lee95", "69abe0f33373fb8726da459b638dd43408e7bd26dd42e8d4b179602bf9c3e5c8", "이용주", "남", "010-1111-1111", 1);
insert into member
values("door97", "3b6e0313282df012397bdd86ee181f55a4aa1ed73fc5ef7b54ec05b5b57d89b8", "문은경", "여", "010-2222-2222", 0);
insert into member
values("jeong96", "05f19c16d9265110cfd2d4c0fd1ec0e912a248b1da8010241369370d8829cd30", "정주훈", "남", "010-3333-3333", 0);
insert into member
values("root", "74b61d2b8725cdbef63bbfff86c5bb428d91d80fb268e0969f71ad210d74fcef", "시스템관리자", "", "", 2);
drop table if exists performance;
create table performance(
   name varchar(20) NOT NULL,
   type varchar(10) DEFAULT NULL,
   time int DEFAULT '0',
   id varchar(20) NOT NULL,
   primary key(name)
);
insert into performance
values("국립무용단 향연", "dance", 100, "inside94");
insert into performance
values("유니버설발레단-발레 춘향", "dance", 115, "inside94");
insert into performance
values("소노리테 목관5중주 정기연주회", "concert", 80, "inside94");
insert into performance
values("오페라-라 보엠", "opera", 140, "lee95");
insert into performance
values("햄릿-The actor", "act", 110, "lee95");
insert into performance
values("스웨덴 커넥션1", "dance", 70, "lee95");

drop table if exists performance_stage;
create table performance_stage(
   place varchar(20) NOT NULL,
   seatOfR int DEFAULT '0',
   seatOfS int DEFAULT '0',
   seatOfA int DEFAULT '0',
   primary key(place)
);
insert into performance_stage
values("오페라극장", 3, 4, 6);
insert into performance_stage
values("CJ토월극장", 5, 5, 7);
insert into performance_stage
values("자유소극장", 4, 5, 5);
insert into performance_stage
values("콘서트홀", 4, 3, 3);

drop table if exists open_performance;
create table open_performance(
   pno int NOT NULL AUTO_INCREMENT,
   name varchar(20) DEFAULT NULL,
   place varchar(20) DEFAULT NULL,
   sdate date DEFAULT NULL,
   edate date DEFAULT NULL,
   stime varchar(20) DEFAULT NULL,
   priceSeatR int DEFAULT '0',
   priceSeatS int DEFAULT '0',
   priceSeatA int DEFAULT '0',
   id varchar(20) NOT NULL,
   opened int DEFAULT '0',
   primary key(pno)
);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("국립무용단 향연", "오페라극장", "2018-06-18", "2018-06-19", "20:00", 70000, 50000, 30000, "inside94", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("유니버설발레단-발레 춘향", "CJ 토월극장", "2018-06-15", "18-06-16", "19:00", 80000, 60000, 30000, "inside94", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("소노리테 목관5중주 정기연주회", "콘서트홀", "2018-06-27", "18-06-27", "14:00", 30000, 30000, 30000, "inside94", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("오페라-라 보엠", "오페라극장", "2018-06-10", "2018-06-15", "19:30", 380000, 280000, 150000, "lee95", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id)
values("햄릿-The actor", "자유소극장", "2018-06-22", "2018-07-15", "19:00", 50000, 35000, 20000, "lee95");
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id)
values("스웨덴 커넥션1", "자유소극장", "2018-06-15", "2018-06-17", "18:00", 30000, 20000, 10000, "lee95");
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("스웨덴 커넥션1", "자유소극장", "2018-06-28", "2018-06-30", "17:30", 30000, 20000, 10000, "lee95", 2);

drop table if exists exhibition;
create table exhibition(
   name varchar(20) NOT NULL,
   genre varchar(20) DEFAULT NULL,
   sponsor varchar(20) DEFAULT NULL,
   id varchar(20) NOT NULL,
   primary key(name)
);
insert into exhibition
values("나는 신범돈이다", "art", "신범돈", "inside94");
insert into exhibition
values("제5회 대한민국국제포토페스티벌", "photo", "하얀나무", "inside94");
insert into exhibition
values("The Loop-텍스타일 디자인전", "art", "여명벽지주식회사", "lee95");
insert into exhibition
values("한메이린 세계순회전-서울", "caligraphy", "예술의전당", "lee95");

drop table if exists exhibition_stage;
create table exhibition_stage(
   place varchar(20) NOT NULL,
   closure date DEFAULT NULL,
   primary key(place)
);
insert into exhibition_stage
values("한가람 미술관", "2018-06-15");
insert into exhibition_stage
values("한가람디자인미술관", "2018-07-02");
insert into exhibition_stage
values("서울서예박물관", "2018-06-25");

drop table if exists open_exhibition;
create table open_exhibition(
   eno int NOT NULL AUTO_INCREMENT,
   name varchar(20) DEFAULT NULL,
   place varchar(20) DEFAULT NULL,
   sdate date DEFAULT NULL,
   edate date DEFAULT NULL,
   price int DEFAULT '0',
   id varchar(20) DEFAULT NULL,
   opened int DEFAULT '0',
   primary key(eno)
);
insert into open_exhibition (name, place, sdate, edate, price, id)
values("나는 신범돈이다", "한가람 미술관", "2018-06-13", "2018-06-20", 0, "inside94");
insert into open_exhibition (name, place, sdate, edate, price, id, opened)
values("제5회 대한민국국제포토페스티벌", "한가람디자인미술관", "2018-05-31", "2018-06-18", 10000, "inside94", 1);
insert into open_exhibition (name, place, sdate, edate, price, id)
values("The Loop-텍스타일 디자인전", "한가람디자인미술관", "2018-06-29", "2018-07-08", 0, "lee95");
insert into open_exhibition (name, place, sdate, edate, price, id, opened)
values("한메이린 세계순회전-서울", "서울서예박물관", "2018-06-06", "2018-07-08", 5000, "lee95", 1);
insert into open_exhibition (name, place, sdate, edate, price, id, opened)
values("나는 신범돈이다", "한가람 미술관", "2018-06-23", "2018-06-25", 25000, "inside94", 2);

drop table if exists ticketing;
create table ticketing(
   tno int NOT NULL AUTO_INCREMENT,
   id varchar(20) NOT NULL,
   pno int NOT NULL,
   seat varchar(10) DEFAULT NULL,
   tdate date DEFAULT NULL,
   primary key(tno)
);
insert into ticketing (id, pno, seat, tdate)
values("door97", 3, "A02", "2018-06-02");
insert into ticketing (id, pno, seat, tdate)
values("door97", 1, "R01", "2018-06-07");
insert into ticketing (id, pno, seat, tdate)
values("jeong96", 2, "S03", "2018-06-10");
insert into ticketing (id, pno, seat, tdate)
values("jeong96", 4, "R02", "2018-06-12");