쓰레기통 trashcan
create table trashcan(
   trashcan_number varchar2(100), -- 쓰레기통번호
   trashcan_lat number,
   trashcan_lng number
);


select * from TRASHCAN;

insert into 


/// 그냥 리포트 사용하자



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

-- 채팅
채팅번호시퀀스 num_chat
drop sequence num_chat;
create sequence num_chat
increment by 1
start with 1;
 
채팅테이블 chat
drop table chat;
create table chat(
	chat_number number primary key, -- 채팅 번호
	chatroom_number number, -- 채팅방 번호 (공고 번호를 사용) 
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

-- 이건 한 행에만 실행시킬 수 있어
UPDATE testday SET day = (select day+7
						  from testday
						  WHERE day < sysdate
						  and num = 1)
where num=1;

-- 전체 행을 한꺼번에 업데이트 할 수는 없을까?
UPDATE (select day from testday where day<sysdate) set day = day+7;


TO_CHAR(SYSDATE, 'YYYYMMDD')
(날짜만 반환, ex> 20140416);
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL; 


update notice set limited_number = (select limited_number+1 from notice where notice_number = 29) where notice_number = 29;
update notice set limited_number = (select limited_number+1 from notice where notice_number = 30) where notice_number = 30;


----------드랍 조심하기!!!!!!!!!!!!!!----------------
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


-- 컬럼 추가
ALTER TABLE tip_off ADD notice_check VARCHAR(25);
-- 컬럼 드랍
ALTER TABLE notice DROP COLUMN notice_check;

-- 제보
제보번호시퀀스 num_tip_off
drop sequence num_tip_off;
create sequence num_tip_off
increment by 1
start with 1;

제보테이블 tip_off 
drop table tip_off;
create table tip_off(
report_number number primary key, -- 제보 번호
report_date date, -- 제보 날짜
lat number, -- 위도
img varchar2(100), -- 이미지
lng number, -- 경도
addr varchar2(100), -- 한글주소
notice_check number -- 제보->공고로 사용될 때 (사용되기 전 0, 사용된 후 1)
);


INSERT INTO TIP_OFF values (8000, SYSDATE, 35.122, '제보3', 126.91, '3경도그대로', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 40.12, '제보4', 140.91, '4아주멀리', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.11, '제보1', 126.90, '5둘다바꿔본', 0);








-- 1,2,3 넣어두고  제보 시작하면 공고
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.12, '제보1', 126.91, '주소1', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.12, '제보2', 126.913, '2위도그대로', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.122, '제보3', 126.91, '3경도그대로', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 40.12, '제보4', 140.91, '4아주멀리', 0);
INSERT INTO TIP_OFF values (num_tip_off.nextval, SYSDATE, 35.11, '제보1', 126.90, '5둘다바꿔본', 0);

select * from tip_off;
UPDATE tip_off SET notice_check = 1 WHERE report_number = 1
delete from tip_off where report_number = 5;
select * from tip_off;

-- 공고
공고시퀀스
drop sequence num_notice;
create sequence num_notice
increment by 1
start with 1;

공고테이블 notice
drop table notice;
create table notice(
	notice_number number, -- 공고번호
	tip_off_number number, -- 제보 번호
	notice_date date, -- 작성일자
	limited_number varchar2(100), -- 제한 인원수
	plog_date date, -- 플로깅 날짜
	notice_image varchar2(100), -- 제보 사진
	address varchar(200), -- 한글 주소
	lat number, -- 위도
	lng number, -- 경도
	constraint notice_pk primary key (notice_number));
	-- 제보 프라이머리는 우선 없이
	
select * from notice;

(reportPostWrite.jsp페이지)latdd : 35.150353176284185
(reportPostWrite.jsp페이지)lngdd :126.91079981240534
(reportPostWrite.jsp페이지)addrdd :광주광역시 동구 수기동

공고 매칭하면 35.15 & 126.91 기준으로 14352 로 뜨는지 확인 ok
insert into notice values (num_notice.nextval, 1, sysdate, 0, sysdate+7, '사진1', '광주1', 35.15, 126.91);
insert into notice values (num_notice.nextval, 2, sysdate, 0, sysdate+7, '사진2', '서울2', 45.15, 226.91);
insert into notice values (num_notice.nextval, 3, sysdate, 0, sysdate+7, '사진3', '안녕3', 35.25, 127.01);
insert into notice values (num_notice.nextval, 4, sysdate, 0, sysdate+7, '사진4', '4', 35.16, 126.92);
insert into notice values (num_notice.nextval, 5, sysdate, 0, sysdate+7, '사진5', '5플로깅장소', 36.15, 127.91);

select * from (select report_number, report_date, lat, img, lng , addr, notice_check,
6371*acos(ROUND(cos(35.15*0.017453)*cos(lat*0.017453)*cos(lng*0.017453-126.91*0.017453)
+sin(35.15*0.017453)*sin(lat*0.017453))) as distance from tip_off order by distance) t 
WHERE t.distance<2;

-- 연결 테이블
drop table notice_member;

create table notice_member( 
   notice_number number,
   member_id varchar2(100),
   review_check VARCHAR(25),
   constraint notice_number_fk foreign key(notice_number) references notice(notice_number),
   constraint memberiid_fk foreign key(member_id) references member(member_id)
);



select * from NOTICE_MEMBER;
-- 컬럼 추가
ALTER TABLE notice_member ADD review_check VARCHAR(25);
-- 컬럼 드랍
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

-- 채팅
채팅번호시퀀스 num_chat
drop sequence num_chat;
create sequence num_chat
increment by 1
start with 1;

채팅테이블 chat
drop table chat;
create table chat(
	chat_number number primary key, -- 채팅 번호
	chatroom_number number, -- 채팅방 번호 (공고 번호를 사용) 
	member_id varchar(100), 
	content varchar(200),
	day date,
	constraint chat_chatroom_number_fk foreign key (chatroom_number)
	references notice(notice_number));
	
	
-- 멤버 테이블
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


insert into member values ()
insert into review_board values( num_review_board.nextval, 'dkwk', sysdate, 'null',35.147556,126.919400,'무야호', '정말이지 환상...ㅎ','1L'
,'10KM');
insert into review_board values( num_review_board.nextval, 'dkwk', sysdate, 'null',35.146691, 126.920524,'무야호', '역시 이맛에 플로깅 하나봅니다!','1L'
,'10KM');
insert into review_board values( num_review_board.nextval, 'dkwk', sysdate, 'null',35.148042, 126.920256,'무야호', '말해뭐해...!','1L'
,'10KM');