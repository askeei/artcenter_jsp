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
values("inside94", "4c4ea1e248d127717679862f032dce8e6dd5e749c7f1342c0668da9017f225bc", "�ȼ���", "��", "010-0000-0000", 1);
insert into member
values("lee95", "69abe0f33373fb8726da459b638dd43408e7bd26dd42e8d4b179602bf9c3e5c8", "�̿���", "��", "010-1111-1111", 1);
insert into member
values("door97", "3b6e0313282df012397bdd86ee181f55a4aa1ed73fc5ef7b54ec05b5b57d89b8", "������", "��", "010-2222-2222", 0);
insert into member
values("jeong96", "05f19c16d9265110cfd2d4c0fd1ec0e912a248b1da8010241369370d8829cd30", "������", "��", "010-3333-3333", 0);
insert into member
values("root", "74b61d2b8725cdbef63bbfff86c5bb428d91d80fb268e0969f71ad210d74fcef", "�ý��۰�����", "", "", 2);
drop table if exists performance;
create table performance(
   name varchar(20) NOT NULL,
   type varchar(10) DEFAULT NULL,
   time int DEFAULT '0',
   id varchar(20) NOT NULL,
   primary key(name)
);
insert into performance
values("��������� �⿬", "dance", 100, "inside94");
insert into performance
values("���Ϲ����߷���-�߷� ����", "dance", 115, "inside94");
insert into performance
values("�ҳ븮�� ���5���� ���⿬��ȸ", "concert", 80, "inside94");
insert into performance
values("�����-�� ����", "opera", 140, "lee95");
insert into performance
values("�ܸ�-The actor", "act", 110, "lee95");
insert into performance
values("������ Ŀ�ؼ�1", "dance", 70, "lee95");

drop table if exists performance_stage;
create table performance_stage(
   place varchar(20) NOT NULL,
   seatOfR int DEFAULT '0',
   seatOfS int DEFAULT '0',
   seatOfA int DEFAULT '0',
   primary key(place)
);
insert into performance_stage
values("��������", 3, 4, 6);
insert into performance_stage
values("CJ�������", 5, 5, 7);
insert into performance_stage
values("�����ұ���", 4, 5, 5);
insert into performance_stage
values("�ܼ�ƮȦ", 4, 3, 3);

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
values("��������� �⿬", "��������", "2018-06-18", "2018-06-19", "20:00", 70000, 50000, 30000, "inside94", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("���Ϲ����߷���-�߷� ����", "CJ �������", "2018-06-15", "18-06-16", "19:00", 80000, 60000, 30000, "inside94", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("�ҳ븮�� ���5���� ���⿬��ȸ", "�ܼ�ƮȦ", "2018-06-27", "18-06-27", "14:00", 30000, 30000, 30000, "inside94", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("�����-�� ����", "��������", "2018-06-10", "2018-06-15", "19:30", 380000, 280000, 150000, "lee95", 1);
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id)
values("�ܸ�-The actor", "�����ұ���", "2018-06-22", "2018-07-15", "19:00", 50000, 35000, 20000, "lee95");
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id)
values("������ Ŀ�ؼ�1", "�����ұ���", "2018-06-15", "2018-06-17", "18:00", 30000, 20000, 10000, "lee95");
insert into open_performance (name, place, sdate, edate, stime, priceSeatR, priceSeatS, priceSeatA, id, opened)
values("������ Ŀ�ؼ�1", "�����ұ���", "2018-06-28", "2018-06-30", "17:30", 30000, 20000, 10000, "lee95", 2);

drop table if exists exhibition;
create table exhibition(
   name varchar(20) NOT NULL,
   genre varchar(20) DEFAULT NULL,
   sponsor varchar(20) DEFAULT NULL,
   id varchar(20) NOT NULL,
   primary key(name)
);
insert into exhibition
values("���� �Ź����̴�", "art", "�Ź���", "inside94");
insert into exhibition
values("��5ȸ ���ѹα����������佺Ƽ��", "photo", "�Ͼᳪ��", "inside94");
insert into exhibition
values("The Loop-�ؽ�Ÿ�� ��������", "art", "�������ֽ�ȸ��", "lee95");
insert into exhibition
values("�Ѹ��̸� �����ȸ��-����", "caligraphy", "����������", "lee95");

drop table if exists exhibition_stage;
create table exhibition_stage(
   place varchar(20) NOT NULL,
   closure date DEFAULT NULL,
   primary key(place)
);
insert into exhibition_stage
values("�Ѱ��� �̼���", "2018-06-15");
insert into exhibition_stage
values("�Ѱ��������ι̼���", "2018-07-02");
insert into exhibition_stage
values("���Ｍ���ڹ���", "2018-06-25");

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
values("���� �Ź����̴�", "�Ѱ��� �̼���", "2018-06-13", "2018-06-20", 0, "inside94");
insert into open_exhibition (name, place, sdate, edate, price, id, opened)
values("��5ȸ ���ѹα����������佺Ƽ��", "�Ѱ��������ι̼���", "2018-05-31", "2018-06-18", 10000, "inside94", 1);
insert into open_exhibition (name, place, sdate, edate, price, id)
values("The Loop-�ؽ�Ÿ�� ��������", "�Ѱ��������ι̼���", "2018-06-29", "2018-07-08", 0, "lee95");
insert into open_exhibition (name, place, sdate, edate, price, id, opened)
values("�Ѹ��̸� �����ȸ��-����", "���Ｍ���ڹ���", "2018-06-06", "2018-07-08", 5000, "lee95", 1);
insert into open_exhibition (name, place, sdate, edate, price, id, opened)
values("���� �Ź����̴�", "�Ѱ��� �̼���", "2018-06-23", "2018-06-25", 25000, "inside94", 2);

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