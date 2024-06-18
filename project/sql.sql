UPDATE tip_off SET notice_check = 0;
select * from tip_off;


select * from notice;

INSERT INTO board_num VALUES(num_board_num.nextval,64,1,1,1,sysdate)
;(select board_num from board where board_num = 63)
select * from board_num;
select * from board;
drop table board_num;
채팅 chat
create table chat(
   chat_number number primary key, -- 채팅 번호
   chatroom_number number, -- 채팅방 번호 (공고 번호를 사용) 
   member_id varchar(100), -- 나중에 완성되면 포린키로 연결하기
   content varchar(200),
   day date,
   constraint chat_chatroom_number_fk foreign key (chatroom_number)
   references notice(notice_number));

drop table chattable;
select * from notice;
채팅번호시퀀스 num_chat
drop sequence num_chat;

create sequence num_chat
increment by 1
start with 1
maxvalue 9999;

select * from chattable;

insert into CHATTABLE values('1','test','test', sysdate );

게시판 board
create table board(
   board_num number primary key, -- 게시물 번호
   member_id varchar2(100) references member(member_id), -- 아이디
   board_date date,    -- 작성일자
   board_content varchar2(1000), -- 게시글 내용
   board_title varchar2(100), -- 게시글 제목
   board_image varchar2(100) -- 게시글 사진
);
select * from board;
--
insert into board (board_num,member_id,board_date,board_content,board_title,board_image) 
values(num_board1.nextval,'test',sysdate,'test','test','test');




drop table board;

drop sequence num_board1
시퀀스 num_board
create sequence num_board1
increment by 1
start with 1
maxvalue 9999;


게시판댓글 board_num
create table board_num(
   comments_number varchar2(100), -- 댓글 번호 
   board_num number, -- 게시물 번호
   member_id varchar2(100), -- 아이디
   comments_pw varchar2(100), -- 댓글 비밀번호
   comments_contents varchar2(100), -- 댓글 내용
   comments_date date, --sysdate; 작성일자
   constraint board_num_pk primary key (comments_number),
   constraint board_fk foreign key(board_num) references board(board_num),
   constraint memberID_fk foreign key(member_id) references member(member_id)
);

insert into board_num(comments_number,board_num,member_id,comments_pw,comments_contents,comments_date) values(num_board_num.nextval,'test','test','test','test','sysdate');

select * from BOARD_NUM;


drop table board_num;

시퀀스 num_board_num
create sequence num_board_num
start with 1 -- 시작숫자
increment by 1; -- 증감숫자

사용자 member
create table member(
   member_id varchar2(100), -- 아이디
   member_pw varchar2(100), -- 비밀번호
   member_name varchar2(100), -- 이름
   member_age number, -- 나이
   member_lat number, -- 주소지 위도
   member_lng number, -- 주소지 경도
   member_plog_own varchar2(100), -- 플로깅 참여 여부
   member_plog_count number, -- 플로깅 횟수
   constraint member_pk primary key (member_id)   
);
ALTER TABLE member ADD(point VARCHAR2(1000)); 
select * from member;
insert into member values('test','test','test',1,'test','test','12','test',1);


--플로깅 횟수에 따른 포인트 적립 시퀀스
create sequence numPoint
start with 0 -- 시작숫자
increment by 10 -- 증감숫자


select * from member
drop table member1;
delete table m
select * from tip_off;
후기게시판 review_board
create table review_board(
   review_number number, --게시물 번호
   member_id varchar2(100), -- 아이디
   review_date date, -- 작성일자
   review_image varchar2(100), -- 게시물 사진
   lat number, -- 위도
   lng number,
   contents varchar2(1000), -- 게시글 내용
   review_title varchar2(100), -- 게시글 제목
   trash varchar2(100), --종량제쓰레기리터
   run varchar2(100), -- 거리
   constraint review_board_pk primary key (review_number),
   constraint member_fk foreign key(member_id) references member(member_id)
);

drop table review_board;
select * from review_board;
update review_board set lng = 126.919400;
select * from review_board where review_number = 2;



시퀀스 num_review_board
create sequence num_review_board
start with 1 -- 시작숫자
increment by 1;-- 증감숫자


시퀀스 num_notice_number
create sequence num_notice_number
start with 1 -- 시작숫자
increment by 1; -- 증감숫자

시퀀스 num_user_board
create sequence num_user_board
start with 1 -- 시작숫자
increment by 1; -- 증감숫자

제보 tip_off 
create table tip_off(
   report_number number primary key, -- 제보 번호
   report_date date, -- 제보 날짜
   lat number, -- 위도
   img varchar2(100), -- 이미지
   lng number, -- 경도
   addr varchar2(100) -- 한글주소
);


insert into tip_off values ( num_tip_off.nextval, sysdate, 1, 'test', 1, 'test');
insert into tip_off values ( num_tip_off.nextval, sysdate, 2, 'test2', 2, 'test2');
insert into tip_off values ( num_tip_off.nextval, sysdate, 3, 'test3', 3, 'test3');
insert into tip_off values ( num_tip_off.nextval, sysdate, 3, 'test3', 3, 'test3');
select * from tip_off;

DROP SEQUENCE num_tip_off;
시퀀스 num_tip_off
create sequence num_tip_off
increment by 1
start with 1
maxvalue 9999;

쓰레기통 trashcan
create table trashcan(
   trashcan_number varchar2(100), -- 쓰레기통번호
   trashcan_lat number,
   trashcan_lng number,
   constraint tip_off_pk primary key (tip_off_number),
);
--




플로깅내역 untitled
create table untitled(
   member_id varchar2(100), -- 아이디
   notice_number varchar2(100), -- 공고번호
   point varchar2(100), -- 적립금 현황
   constraint member_id_fk foreign key(member_id) references member(member_id)
   constraint notice_number_fk foreign key(notice_number) references notice(notice_number)
   constraint point_fk foreign key(point) references local_governments(point)
);
--
insert into(member_id,notice_number,point) values('test','test','test');


CREATE SEQUENCE Report_num --시퀀스이름 EX_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1


--test notice
create table notice(
   notice_number number,    -- 공고번호
   tip_off_number number,   -- 제보 번호
   notice_date date, 		-- 작성일자
   limited_number number,   -- 제한 인원수
   plog_date date, 			-- 플로깅 날짜
   notice_image varchar2(100),-- 제보 사진?
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

--임의로 데이터 넣어봄
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


insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','광주'
,35.147556, 126.919400);
insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','남구'
,35.148042, 126.920256);
insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','서구'
,35.146691, 126.920524);
insert into notice values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','북구'
,0.3,0.5);
insert into review values( num_notice.nextval, 1, sysdate, limit_number.nextval, sysdate, 'test','북구'
,0.3,0.5);

select * from notice;
select * from TIP_OFF;

시퀀스 num_notice
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