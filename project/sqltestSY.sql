�������� trashcan
create table trashcan(
   trashcan_number varchar2(100), -- ���������ȣ
   trashcan_lat number,
   trashcan_lng number
);


select * from TRASHCAN;

insert into 


/// �׳� ����Ʈ �������



����� member
create table member(
   member_id varchar2(100), -- ���̵�
   member_pw varchar2(100), -- ��й�ȣ
   member_name varchar2(100), -- �̸�
   member_age number, -- ����
   member_lat number, -- �ּ��� ����
   member_lng number, -- �ּ��� �浵
   member_plog_own varchar2(100), -- �÷α� ���� ����
   member_plog_count number, -- �÷α� Ƚ��
   constraint member_pk primary key (member_id)   
);
ALTER TABLE member ADD(point VARCHAR2(1000));
ALTER TABLE member modify point number(point VARCHAR2(1000)); 
select * from member;
insert into member values('test','test','test',1,'test','test','12','test',1, );

select * from member;

select point from member where member_id = 'mm';

select * from member;
select * from notice;

delete from notice where notice_number = 122;
select * from chat;
delete from chat where chatroom_number >=119;

insert into member values('testid','testpw','testname',1, 32.5, 126.9,'testplog', 12, 'testpoint');
update member set member_pw='2', member_name='2', member_age=2 where member_id = 'testid';
delete from member where member_id = 'testid';
delete from chat where member_id = 'te';
delete from NOTICE_MEMBER  where member_id = 'te'

select * from notice_member
select * from tip_off;

-- ä��
ä�ù�ȣ������ num_chat
drop sequence num_chat;
create sequence num_chat
increment by 1
start with 1;
 
ä�����̺� chat
drop table chat;
create table chat(
	chat_number number primary key, -- ä�� ��ȣ
	chatroom_number number, -- ä�ù� ��ȣ (���� ��ȣ�� ���) 
	member_id varchar(100), 
	content varchar(200),
	day date,
	constraint chat_chatroom_number_fk foreign key (chatroom_number)
	references notice(notice_number));
	
select distinct chatroom_number from chat where member_id='1';

select * from chat;

select * from testday;
drop table testday;

create table testday(
	num number,
	day date	
);

insert into testday values (1, sysdate);
insert into testday values (2, sysdate);
insert into testday values (3, sysdate);
insert into testday values (4, sysdate);

select day from testday WHERE day < sysdate

-- �̰� �� �࿡�� �����ų �� �־�
UPDATE testday SET day = (select day+7
						  from testday
						  WHERE day < sysdate
						  and num = 1)
where num=1;

-- ��ü ���� �Ѳ����� ������Ʈ �� ���� ������?
UPDATE (select day from testday where day<sysdate) set day = day+7;


TO_CHAR(SYSDATE, 'YYYYMMDD')
(��¥�� ��ȯ, ex> 20140416);
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL; 


update notice set limited_number = (select limited_number+1 from notice where notice_number = 29) where notice_number = 29;
update notice set limited_number = (select limited_number+1 from notice where notice_number = 30) where notice_number = 30;


----------��� �����ϱ�!!!!!!!!!!!!!!----------------
drop table chat;
drop table notice_member;
drop table notice;
drop table tip_off;

drop sequence num_chat;
drop sequence num_notice;
drop sequence num_tip_off;

select * from chat; 
select * from notice_member;
select * from notice;
select * from tip_off;
select * from member;


-- �÷� �߰�
ALTER TABLE tip_off ADD notice_check VARCHAR(25);
-- �÷� ���
ALTER TABLE notice DROP COLUMN notice_check;

-- ����
������ȣ������ num_tip_off
drop sequence num_tip_off;
create sequence num_tip_off
increment by 1
start with 1;

�������̺� tip_off 
drop table tip_off;
create table tip_off(
report_number number primary key, -- ���� ��ȣ
report_date date, -- ���� ��¥
lat number, -- ����
img varchar2(100), -- �̹���
lng number, -- �浵
addr varchar2(100), -- �ѱ��ּ�
notice_check number -- ����->����� ���� �� (���Ǳ� �� 0, ���� �� 1)
);


INSERT INTO TIP_OFF values (8000, SYSDATE, 35.122, '����3', 126.91, '3�浵�״��', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 40.12, '����4', 140.91, '4���ָָ�', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.11, '����1', 126.90, '5�Ѵٹٲ㺻', 0);








-- 1,2,3 �־�ΰ�  ���� �����ϸ� ����
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.12, '����1', 126.91, '�ּ�1', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.12, '����2', 126.913, '2�����״��', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.122, '����3', 126.91, '3�浵�״��', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 40.12, '����4', 140.91, '4���ָָ�', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.11, '����1', 126.90, '5�Ѵٹٲ㺻', 0);

select * from tip_off;
UPDATE tip_off SET notice_check = 1 WHERE report_number = 1
delete from tip_off where report_number = 5;
select * from tip_off;

-- ����
���������
drop sequence num_notice;
create sequence num_notice
increment by 1
start with 1;

�������̺� notice
drop table notice;
create table notice(
	notice_number number, -- �����ȣ
	tip_off_number number, -- ���� ��ȣ
	notice_date date, -- �ۼ�����
	limited_number varchar2(100), -- ���� �ο���
	plog_date date, -- �÷α� ��¥
	notice_image varchar2(100), -- ���� ����
	address varchar(200), -- �ѱ� �ּ�
	lat number, -- ����
	lng number, -- �浵
	constraint notice_pk primary key (notice_number));
	-- ���� �����̸Ӹ��� �켱 ����
	
select * from notice;

(reportPostWrite.jsp������)latdd : 35.150353176284185
(reportPostWrite.jsp������)lngdd :126.91079981240534
(reportPostWrite.jsp������)addrdd :���ֱ����� ���� ���⵿

���� ��Ī�ϸ� 35.15 & 126.91 �������� 14352 �� �ߴ��� Ȯ�� ok
insert into notice values (num_notice.nextval, 1, sysdate, 0, sysdate+7, '����1', '����1', 35.15, 126.91);
insert into notice values (num_notice.nextval, 2, sysdate, 0, sysdate+7, '����2', '����2', 45.15, 226.91);
insert into notice values (num_notice.nextval, 3, sysdate, 0, sysdate+7, '����3', '�ȳ�3', 35.25, 127.01);
insert into notice values (num_notice.nextval, 4, sysdate, 0, sysdate+7, '����4', '4', 35.16, 126.92);
insert into notice values (num_notice.nextval, 5, sysdate, 0, sysdate+7, '����5', '5�÷α����', 36.15, 127.91);

select * from (select report_number, report_date, lat, img, lng , addr, notice_check,
6371*acos(ROUND(cos(35.15*0.017453)*cos(lat*0.017453)*cos(lng*0.017453-126.91*0.017453)
+sin(35.15*0.017453)*sin(lat*0.017453))) as distance from tip_off order by distance) t 
WHERE t.distance<2;

-- ���� ���̺�
drop table notice_member;

create table notice_member( 
   notice_number number,
   member_id varchar2(100),
   review_check VARCHAR(25),
   constraint notice_number_fk foreign key(notice_number) references notice(notice_number),
   constraint memberiid_fk foreign key(member_id) references member(member_id)
);



select * from NOTICE_MEMBER;
-- �÷� �߰�
ALTER TABLE notice_member ADD review_check VARCHAR(25);
-- �÷� ���
ALTER TABLE notice DROP COLUMN review_check;

delete from notice_member where member_id = 'f';
delete from notice_member where member_id = 'n';
delete from notice_member where member_id = '2';

insert into notice_member values (1, 'f', 0);
insert into notice_member values (5, 'f', 0);
insert into notice_member values (1, 'n', 0);
insert into notice_member values (3, 'n', 0);
insert into notice_member values (1, '2', 0);
insert into notice_member values (2, '2', 0);
insert into notice_member values (3, '2', 0);

select * from notice_member;
select * from member;

-- ä��
ä�ù�ȣ������ num_chat
drop sequence num_chat;
create sequence num_chat
increment by 1
start with 1;

ä�����̺� chat
drop table chat;
create table chat(
	chat_number number primary key, -- ä�� ��ȣ
	chatroom_number number, -- ä�ù� ��ȣ (���� ��ȣ�� ���) 
	member_id varchar(100), 
	content varchar(200),
	day date,
	constraint chat_chatroom_number_fk foreign key (chatroom_number)
	references notice(notice_number));
	
	
-- ��� ���̺�
create table member(
   member_id varchar2(100), -- ���̵�
   member_pw varchar2(100), -- ��й�ȣ
   member_name varchar2(100), -- �̸�
   member_age number, -- ����
   member_lat number, -- �ּ��� ����
   member_lng number, -- �ּ��� �浵
   member_plog_own varchar2(100), -- �÷α� ���� ����
   member_plog_count number, -- �÷α� Ƚ��
   constraint member_pk primary key (member_id)   
);


insert into member values ()
insert into review_board values( num_review_board.nextval, 'dkwk', sysdate, 'null',35.147556,126.919400,'����ȣ', '�������� ȯ��...��','1L'
,'10KM');
insert into review_board values( num_review_board.nextval, 'dkwk', sysdate, 'null',35.146691, 126.920524,'����ȣ', '���� �̸��� �÷α� �ϳ����ϴ�!','1L'
,'10KM');
insert into review_board values( num_review_board.nextval, 'dkwk', sysdate, 'null',35.148042, 126.920256,'����ȣ', '���ع���...!','1L'
,'10KM');