UPDATE tip_off SET notice_check = 0;
select * from tip_off;


select * from notice;

INSERT INTO board_num VALUES(num_board_num.nextval,64,1,1,1,sysdate)
;(select board_num from board where board_num = 63)
select * from board_num;
select * from board;
drop table board_num;
ä�� chat
create table chat(
   chat_number number primary key, -- ä�� ��ȣ
   chatroom_number number, -- ä�ù� ��ȣ (���� ��ȣ�� ���) 
   member_id varchar(100), -- ���߿� �ϼ��Ǹ� ����Ű�� �����ϱ�
   content varchar(200),
   day date,
   constraint chat_chatroom_number_fk foreign key (chatroom_number)
   references notice(notice_number));

drop table chattable;
select * from notice;
ä�ù�ȣ������ num_chat
drop sequence num_chat;

create sequence num_chat
increment by 1
start with 1
maxvalue 9999;

select * from chattable;

insert into CHATTABLE values('1','test','test', sysdate );

�Խ��� board
create table board(
   board_num number primary key, -- �Խù� ��ȣ
   member_id varchar2(100) references member(member_id), -- ���̵�
   board_date date,    -- �ۼ�����
   board_content varchar2(1000), -- �Խñ� ����
   board_title varchar2(100), -- �Խñ� ����
   board_image varchar2(100) -- �Խñ� ����
);
select * from board;
--
insert into board (board_num,member_id,board_date,board_content,board_title,board_image) 
values(num_board1.nextval,'test',sysdate,'test','test','test');




drop table board;

drop sequence num_board1
������ num_board
create sequence num_board1
increment by 1
start with 1
maxvalue 9999;


�Խ��Ǵ�� board_num
create table board_num(
   comments_number varchar2(100), -- ��� ��ȣ 
   board_num number, -- �Խù� ��ȣ
   member_id varchar2(100), -- ���̵�
   comments_pw varchar2(100), -- ��� ��й�ȣ
   comments_contents varchar2(100), -- ��� ����
   comments_date date, --sysdate; �ۼ�����
   constraint board_num_pk primary key (comments_number),
   constraint board_fk foreign key(board_num) references board(board_num),
   constraint memberID_fk foreign key(member_id) references member(member_id)
);

insert into board_num(comments_number,board_num,member_id,comments_pw,comments_contents,comments_date) values(num_board_num.nextval,'test','test','test','test','sysdate');

select * from BOARD_NUM;


drop table board_num;

������ num_board_num
create sequence num_board_num
start with 1 -- ���ۼ���
increment by 1; -- ��������

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
select * from member;
insert into member values('test','test','test',1,'test','test','12','test',1);


--�÷α� Ƚ���� ���� ����Ʈ ���� ������
create sequence numPoint
start with 0 -- ���ۼ���
increment by 10 -- ��������


select * from member
drop table member1;
delete table m
select * from tip_off;
�ı�Խ��� review_board
create table review_board(
   review_number number, --�Խù� ��ȣ
   member_id varchar2(100), -- ���̵�
   review_date date, -- �ۼ�����
   review_image varchar2(100), -- �Խù� ����
   lat number, -- ����
   lng number,
   contents varchar2(1000), -- �Խñ� ����
   review_title varchar2(100), -- �Խñ� ����
   trash varchar2(100), --�����������⸮��
   run varchar2(100), -- �Ÿ�
   constraint review_board_pk primary key (review_number),
   constraint member_fk foreign key(member_id) references member(member_id)
);

drop table review_board;
select * from review_board;
update review_board set lng = 126.919400;
select * from review_board where review_number = 2;



������ num_review_board
create sequence num_review_board
start with 1 -- ���ۼ���
increment by 1;-- ��������


������ num_notice_number
create sequence num_notice_number
start with 1 -- ���ۼ���
increment by 1; -- ��������

������ num_user_board
create sequence num_user_board
start with 1 -- ���ۼ���
increment by 1; -- ��������

���� tip_off 
create table tip_off(
   report_number number primary key, -- ���� ��ȣ
   report_date date, -- ���� ��¥
   lat number, -- ����
   img varchar2(100), -- �̹���
   lng number, -- �浵
   addr varchar2(100) -- �ѱ��ּ�
);


insert into tip_off values ( num_tip_off.nextval, sysdate, 1, 'test', 1, 'test');
insert into tip_off values ( num_tip_off.nextval, sysdate, 2, 'test2', 2, 'test2');
insert into tip_off values ( num_tip_off.nextval, sysdate, 3, 'test3', 3, 'test3');
insert into tip_off values ( num_tip_off.nextval, sysdate, 3, 'test3', 3, 'test3');
select * from tip_off;

DROP SEQUENCE num_tip_off;
������ num_tip_off
create sequence num_tip_off
increment by 1
start with 1
maxvalue 9999;

�������� trashcan
create table trashcan(
   trashcan_number varchar2(100), -- ���������ȣ
   trashcan_lat number,
   trashcan_lng number,
   constraint tip_off_pk primary key (tip_off_number),
);
--




�÷α볻�� untitled
create table untitled(
   member_id varchar2(100), -- ���̵�
   notice_number varchar2(100), -- �����ȣ
   point varchar2(100), -- ������ ��Ȳ
   constraint member_id_fk foreign key(member_id) references member(member_id)
   constraint notice_number_fk foreign key(notice_number) references notice(notice_number)
   constraint point_fk foreign key(point) references local_governments(point)
);
--
insert into(member_id,notice_number,point) values('test','test','test');


CREATE SEQUENCE Report_num --�������̸� EX_SEQ
INCREMENT BY 1 --�������� 1
START WITH 1 --���ۼ��� 1


--test notice
create table notice(
   notice_number number,    -- �����ȣ
   tip_off_number number,   -- ���� ��ȣ
   notice_date date, 		-- �ۼ�����
   limited_number number,   -- ���� �ο���
   plog_date date, 			-- �÷α� ��¥
   notice_image varchar2(100),-- ���� ����?
   address varchar2(100),
   lat number,
   lng number,
   constraint notice_pk primary key (notice_number),
   constraint notice_post_fk foreign key (tip_off_number) references tip_off(report_number)
);
drop table notice;
update notice_member set lat = 
select * from notice;
update notice set review_check = 0

create table notice_member(
	notice_number number,
	member_id varchar2(100),
	constraint notice_number_fk foreign key(notice_number) references notice(notice_number),
    constraint memberiid_fk foreign key(member_id) references member(member_id)
)


ALTER TABLE notice_member ADD review_check VARCHAR(25);
update notice_member set review_check = 0
select * from notice_member;
insert into notice_member(member_id) select m.member_id from member m , notice_member nm where nm.notice_number is not null;


insert into notice_member values((select notice_number from notice))

--���Ƿ� ������ �־
insert into notice_member(notice_number,member_id) values((select notice_number from notice where notice_number =2) ,(select member_id from member where member_id = 'dkwk'));
insert into notice_member(notice_number,member_id) values((select notice_number from notice where notice_number =1) ,(select member_id from member where member_id = 'dkwk'));
insert into notice_member(notice_number,member_id) values((select notice_number from notice where notice_number =3) ,(select member_id from member where member_id = 'dkwk'));

update notice set limited_number = limit_number.nextval  where notice_number = 1;

drop table notice_member;

select * from notice;

update notice set limited_number = 0;

select * from notice_member;

select distinct n.notice_number from notice_member m , notice n
where m.member_id is null in(where)

select * from notice 
where notice_number not in(select notice_number 
							from notice_member 
							where member_id in('dkwk')); 
order by plog_date desc;


insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','����'
,35.147556, 126.919400);
insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','����'
,35.148042, 126.920256);
insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','����'
,35.146691, 126.920524);
insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','�ϱ�'
,0.3,0.5);
insert into review values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','�ϱ�'
,0.3,0.5);

select * from notice;
select * from TIP_OFF;

������ num_notice
create sequence num_notice
increment by 1
start with 1
maxvalue 9999;
drop sequence num_notice;

create sequence limit_number
increment by 1
start with 1
maxvalue 7;

DROP SEQUENCE num_notice;
DROP SEQUENCE Report_num;
DROP SEQUENCE limit_number;
DROP SEQUENCE num_local_governments;
DROP SEQUENCE num_tip_off;
DROP SEQUENCE num_user_board;
DROP SEQUENCE num_board1;
DROP SEQUENCE num_board_num;

drop table notice;
drop table chattable;
drop table board_num;
drop table board;
drop table tip_off;
drop table member;


select address ,lat,lng from notice 
						where notice_number in(select notice_number 
													from notice_member 
													where member_id in('dkwk')) order by plog_date desc