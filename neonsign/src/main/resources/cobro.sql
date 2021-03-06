<<<<<<< HEAD
-- ** DB 초기화순서 ** -------------------------------------------------------------------
drop table RANKING;
drop table REPORTER;
drop table REPORT;
drop table SEARCH_BOARD;
drop table TAG_BOARD;
drop table TAG;
drop table PICKED_ARTICLE;
drop table ITJA_MEMBER;
drop table SUB_ARTICLE;
drop table MAIN_ARTICLE;
drop table BRAIN_MEMBER;
drop sequence main_article_seq;
drop sequence sub_article_seq;
drop sequence report_seq;
-----------------------------------------------------------------------------------
-- ** 테이블조회 ** -----------------------------------------------------------
=======
-- 희
-- ** DB 초기화 순서 ** -------------------------------------------------------------------
drop table RANKING;
drop table REPORTER;
drop table REPORT;
drop table SEARCH_BOARD;
drop table TAG_BOARD;
drop table TAG;
drop table PICKED_ARTICLE;
drop table ITJA_MEMBER;
drop table SUB_ARTICLE;
drop table MAIN_ARTICLE;
drop table BRAIN_MEMBER;
drop sequence main_article_seq;
drop sequence sub_article_seq;
drop sequence report_seq;
-----------------------------------------------------------------------------------
-- ** 테이블 조회 ** -----------------------------------------------------------
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
select * from RANKING;
select * from REPORTER;
select * from REPORT;
select * from SEARCH_BOARD;
select * from TAG_BOARD;
select * from TAG;
select * from PICKED_ARTICLE;
select * from SUB_ARTICLE;
select * from MAIN_ARTICLE;
select * from BRAIN_MEMBER;
select * from ITJA_MEMBER;

-----------------------------------------------------------------------------------
<<<<<<< HEAD
-- ** 뇌온사인회원테이블생성 / 삭제 ** -----------------------------------------------------------
create table BRAIN_MEMBER(
MEMBER_EMAIL varchar2(50) primary key,
MEMBER_NICKNAME varchar2(20) not null,
MEMBER_PASSWORD varchar2(16) not null,
MEMBER_JOIN_DATE date not null,
MEMBER_POINT number default 0,
MEMBER_REPORT_AMOUNT number default 0,
MEMBER_CATEGORY varchar2(30) not null
)
drop table BRAIN_MEMBER
select * from BRAIN_MEMBER;
-----------------------------------------------------------------------------------
-- ** 주제글테이블, 시퀀스생성 / 삭제 ** --------------------------------------------------------
--블록여부 컬럼 추가 1이면 블록상태--
alter table main_article add(MAIN_ARTICLE_BLOCK number default 0);

--블록여부 컬럼 추가 1이면 블록상태--
alter table sub_article add(SUB_ARTICLE_BLOCK number default 0);

create table MAIN_ARTICLE(
MAIN_ARTICLE_NO number primary key,
MEMBER_EMAIL varchar2(50) not null,
MAIN_ARTICLE_TITLE varchar2(60) not null,
MAIN_ARTICLE_CONTENT varchar2(600) not null,
MAIN_ARTICLE_HIT number default 0,  -- 조회수
MAIN_ARTICLE_LIKE number default 0,  -- 주제글만의잇자수 : 작성자포인트에반영
MAIN_ARTICLE_TOTAL_LIKE number default 0,  -- 주제글잇자수 + 잇는글잇자수총합
MAIN_ARTICLE_DATE date not null,
MAIN_ARTICLE_UPDATE_DATE date not null,  -- 잇는글이붙은시간(가장마지막잇는글)
MAIN_ARTICLE_COMPLETE number default 0, -- 신규0, 베스트-1, 완결1
constraint fk_brain_member foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL)
);
create sequence main_article_seq
-- 여기까지생성
drop table MAIN_ARTICLE
drop sequence main_article_seq
select * from MAIN_ARTICLE;
-----------------------------------------------------------------------------------
-- ** 잇는글테이블, 시퀀스생성 / 삭제 ** --------------------------------------------------------
create table SUB_ARTICLE(
SUB_ARTICLE_NO number primary key,
MAIN_ARTICLE_NO number not null,
MEMBER_EMAIL varchar2(50) not null, 
SUB_ARTICLE_GRADE number default 0, --스토리단계몇번째이어지는건지 : 이어진것만달림
SUB_ARTICLE_CONTENT varchar2(600) not null,  
IS_END number default 0,--0이면잇자 1이면끈자(잇는글쓴이가결정)
SUBARTICLE_LIKE number default 0,
IS_CONNECT number not null, --잇자수를비교해이을것인지끈을것인지결정
SUB_ARTICLE_DATE date not null,
constraint fk_main_article foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_sub_article foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL)
);
create sequence sub_article_seq
-- 여기까지생성
drop table SUB_ARTICLE
drop sequence sub_article_seq
select * from SUB_ARTICLE;
-----------------------------------------------------------------------------------
-- ** 잇자멤버테이블생성 / 삭제 ** -----------------------------------------------------------
create table ITJA_MEMBER(
MAIN_ARTICLE_NO number not null,
SUB_ARTICLE_NO number default 0,
MEMBER_EMAIL varchar(50) not null,
constraint fk_itJa_Main_Article_NO foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_itJa_MEMBER_EMAIL foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL),
constraint pk_tag_ITJA_MEMBER primary key(MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL)
)
droptable ITJA_MEMBER
select * table ITJA_MEMBER;
-----------------------------------------------------------------------------------
-- ** 찜리스트테이블생성 / 삭제 ** -----------------------------------------------------------
=======
-- ** 뇌온사인 회원 테이블 생성 / 삭제 ** -----------------------------------------------------------
create table BRAIN_MEMBER(
MEMBER_EMAIL varchar2(50) primary key,
MEMBER_NICKNAME varchar2(20) not null,
MEMBER_PASSWORD varchar2(16) not null,
MEMBER_JOIN_DATE date not null,
MEMBER_POINT number default 0,
MEMBER_REPORT_AMOUNT number default 0,
MEMBER_CATEGORY varchar2(30) not null
)
drop table BRAIN_MEMBER
select * from BRAIN_MEMBER;
-----------------------------------------------------------------------------------
-- ** 주제글 테이블, 시퀀스 생성 / 삭제 ** --------------------------------------------------------
create table MAIN_ARTICLE(
MAIN_ARTICLE_NO number primary key,
MEMBER_EMAIL varchar2(50) not null,
MAIN_ARTICLE_TITLE varchar2(60) not null,
MAIN_ARTICLE_CONTENT varchar2(600) not null,
MAIN_ARTICLE_HIT number default 0,  -- 조회수
MAIN_ARTICLE_LIKE number default 0,  -- 주제글 만의 잇자수 : 작성자 포인트에 반영
MAIN_ARTICLE_TOTAL_LIKE number default 0,  -- 주제글 잇자수 + 잇는글 잇자수 총합
MAIN_ARTICLE_DATE date not null,
MAIN_ARTICLE_UPDATE_DATE date not null,  -- 잇는글이 붙은 시간(가장 마지막 잇는글)
MAIN_ARTICLE_COMPLETE number default 0, -- 신규0, 베스트-1, 완결1
constraint fk_brain_member foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL)
);
create sequence main_article_seq
-- 여기까지 생성
drop table MAIN_ARTICLE
drop sequence main_article_seq
select * from MAIN_ARTICLE;
-----------------------------------------------------------------------------------
-- ** 잇는글 테이블, 시퀀스 생성 / 삭제 ** --------------------------------------------------------
create table SUB_ARTICLE(
SUB_ARTICLE_NO number primary key,
MAIN_ARTICLE_NO number not null,
MEMBER_EMAIL varchar2(50) not null, 
SUB_ARTICLE_GRADE number default 0, --스토리단계 몇번째 이어지는 건지 : 이어진것만 달림
SUB_ARTICLE_CONTENT varchar2(600) not null,  
IS_END number default 0,--0이면 잇자 1이면 끈자(잇는글쓴이가 결정)
SUBARTICLE_LIKE number default 0,
IS_CONNECT number not null, --잇자수를 비교해 이을것인지 끈을 것인지 결정
SUB_ARTICLE_DATE date not null,
constraint fk_main_article foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_sub_article foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL)
);
create sequence sub_article_seq
-- 여기까지 생성
drop table SUB_ARTICLE
drop sequence sub_article_seq
select * from SUB_ARTICLE;
-----------------------------------------------------------------------------------
-- ** 잇자 멤버 테이블 생성 / 삭제 ** -----------------------------------------------------------
create table ITJA_MEMBER(
MAIN_ARTICLE_NO number not null,
SUB_ARTICLE_NO number default 0,
MEMBER_EMAIL varchar(50) not null,
constraint fk_itJa_Main_Article_NO foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_itJa_MEMBER_EMAIL foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL),
constraint pk_tag_ITJA_MEMBER primary key(MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL)
)
drop table ITJA_MEMBER
select * table ITJA_MEMBER;
-----------------------------------------------------------------------------------
-- ** 찜리스트 테이블 생성 / 삭제 ** -----------------------------------------------------------
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
create table PICKED_ARTICLE(
MEMBER_EMAIL varchar2(50) not null,
MAIN_ARTICLE_NO number not null,
constraint fk_brain_member_pricked foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL),
constraint fk_main_article_pricked foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint pk_picked primary key(MEMBER_EMAIL,MAIN_ARTICLE_NO)
)
<<<<<<< HEAD
droptable picked_article
select * from PICKED_ARTICLE;
-----------------------------------------------------------------------------------
-- ** 태그리스트테이블생성 / 삭제 ** ----------------------------------------------------------
=======
drop table picked_article
select * from PICKED_ARTICLE;
-----------------------------------------------------------------------------------
-- ** 태그리스트 테이블 생성 / 삭제 ** ----------------------------------------------------------
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
create table TAG(
TAG_NAME varchar2(30) primary key,
SEARCH_COUNT number default 0
)
drop table TAG
select * from TAG;
-----------------------------------------------------------------------------------
<<<<<<< HEAD
-- ** 태그게시물테이블생성 / 삭제 ** ----------------------------------------------------------
create table TAG_BOARD(
TAG_NAME varchar2(30) , 
MAIN_ARTICLE_NO number ,
constraint fk_tag foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_tag_name foreign key(TAG_NAME) references tag(TAG_NAME),
constraint pk_tag_board primary key(TAG_NAME,MAIN_ARTICLE_NO)
)
droptable TAG_BOARD
select * from TAG_BOARD;
-----------------------------------------------------------------------------------
-- ** 검색어통계용테이블생성 / 삭제 ** --------------------------------------------------------
create table SEARCH_BOARD(
KEYWORD varchar2(30) primary key,
SEARCH_COUNT number not null
)
drop table SEARCH_BOARD
select * from SEARCH_BOARD;
-----------------------------------------------------------------------------------
-- ** 신고내용테이블, 시퀀스생성 / 삭제 ** ------------------------------------------------------
create table REPORT(
REPORT_NO varchar2(30) primary key,
REPORT_DATE date not null,
MAIN_ARTICLE_NO number not null,
SUB_ARTICLE_NO number,
REPORT_AMOUNT number default 0,
STAGES_OF_PROCESS varchar2(20), --여부판단
constraint fk_report_main_article foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_report_sub_article foreign key(SUB_ARTICLE_NO) references sub_article(SUB_ARTICLE_NO)
);
create sequence report_seq
insert into REPORT(REPORT_NO,REPORT_DATE,MAIN_ARTICLE_NO,SUB_ARTICLE_NO,STAGES_OF_PROCESS)
values(report_seq.nextval,sysdate,1,56,'대기')

-- 여기까지생성
drop table REPORT
drop sequence report_seq
select * from REPORT;
-----------------------------------------------------------------------------------
-- ** 신고자테이블(복합키적용) 생성 / 삭제 ** -----------------------------------------------------
create table REPORTER(
REPORT_NO varchar2(30) ,
MEMBER_EMAIL varchar2(50) not null,
constraint fk_report foreign key(REPORT_NO) references report(REPORT_NO),
constraint fk_reporter_main_article foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL),
constraint pk_reporter_no primary key(REPORT_NO,MEMBER_EMAIL)
)
drop table REPORTER
-----------------------------------------------------------------------------------
-- ** 랭킹정보테이블생성 / 삭제 ** -----------------------------------------------------------
create table RANKING(
MEMBER_GRADE varchar2(30) primary key,
MIN_POINT number not null,
MAX_POINT number not null
)
droptable RANKING
select * from RANKING;
-----------------------------------------------------------------------------------
----------------------------- *** 구현확인용 DATA 삽입 *** ----------------------------------
-- ▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽ --
-----------------------------------------------------------------------------------

-- ** 회원등록 ** -----------------------------------------------------------------------
-- 관리자MASTER ~ 일반회원NORMAL, 불량회원BLACK 삽입 : 포인트는디폴트 0 이나임의로삽입함
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('brain@gmail.com','MASTER','aaaa',sysdate,'MASTER'); -- 관리자 : MASTER
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('a@gmail.com','A맨','aaaa',sysdate, 450, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('b@gmail.com','B맨','aaaa',sysdate, 50, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('c@gmail.com','C맨','aaaa',sysdate, 150, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('d@gmail.com','D맨','aaaa',sysdate, 800, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('e@gmail.com','E맨','aaaa',sysdate, 750, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('f@gmail.com','F맨','aaaa',sysdate, 10, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('g@gmail.com','G맨','aaaa',sysdate, 1150, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('h@gmail.com','H맨','aaaa',sysdate, 1250, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('i@gmail.com','I맨','aaaa',sysdate, 10, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('j@gmail.com','J맨','aaaa',sysdate, 350, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('k@gmail.com','K맨','aaaa',sysdate, 550, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('l@gmail.com','L맨','aaaa',sysdate, 15, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('m@gmail.com','M맨','aaaa',sysdate, 90, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('n@gmail.com','N맨','aaaa',sysdate, 250, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('o@gmail.com','O맨','aaaa',sysdate, 760, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('p@gmail.com','P맨','aaaa',sysdate, 980, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('q@gmail.com','Q맨','aaaa',sysdate, 1000, 'NORMAL'); -- 일반회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('r@gmail.com','R맨','aaaa',sysdate, 20, 'BLACK'); -- 일반회원 : BLACK
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('s@gmail.com','S맨','aaaa',sysdate, 80, 'BLACK'); -- 일반회원 : BLACK
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('t@gmail.com','T맨','aaaa',sysdate, 10, 'BLACK'); -- 일반회원 : BLACK

select * from brain_member
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- ** 태그등록 ** -----------------------------------------------------------------------
=======
-- ** 태그 게시물 테이블 생성 / 삭제 ** ----------------------------------------------------------
create table TAG_BOARD(
TAG_NAME varchar2(30) , 
MAIN_ARTICLE_NO number ,
constraint fk_tag foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_tag_name foreign key(TAG_NAME) references tag(TAG_NAME),
constraint pk_tag_board primary key(TAG_NAME,MAIN_ARTICLE_NO)
)
drop table TAG_BOARD
select * from TAG_BOARD;
-----------------------------------------------------------------------------------
-- ** 검색어 통계용 테이블 생성 / 삭제 ** --------------------------------------------------------
create table SEARCH_BOARD(
KEYWORD varchar2(30) primary key,
SEARCH_COUNT number not null
)
drop table SEARCH_BOARD
select * from SEARCH_BOARD;
-----------------------------------------------------------------------------------
-- ** 신고내용 테이블, 시퀀스 생성 / 삭제 ** ------------------------------------------------------
create table REPORT(
REPORT_NO varchar2(30) primary key,
REPORT_DATE date not null,
MAIN_ARTICLE_NO number not null,
SUB_ARTICLE_NO number not null,
REPORT_AMOUNT number default 0,
STAGES_OF_PROCESS varchar2(20), --여부 판단
constraint fk_report_main_article foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_report_sub_article foreign key(SUB_ARTICLE_NO) references sub_article(SUB_ARTICLE_NO)
);
create sequence report_seq
-- 여기 까지 생성
drop table REPORT
drop sequence report_seq
select * from REPORT;
-----------------------------------------------------------------------------------
-- ** 신고자 테이블(복합키 적용) 생성 / 삭제 ** -----------------------------------------------------
create table REPORTER(
REPORT_NO varchar2(30) ,
MEMBER_EMAIL varchar2(50) not null,
constraint fk_report foreign key(REPORT_NO) references report(REPORT_NO),
constraint fk_reporter_main_article foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL),
constraint pk_reporter_no primary key(REPORT_NO,MEMBER_EMAIL)
)
drop table REPORTER
-----------------------------------------------------------------------------------
-- ** 랭킹 정보 테이블 생성 / 삭제 ** -----------------------------------------------------------
create table RANKING(
MEMBER_GRADE varchar2(30) primary key,
MIN_POINT number not null,
MAX_POINT number not null
)
drop table RANKING
select * from RANKING;
-----------------------------------------------------------------------------------
----------------------------- *** 구현 확인용 DATA 삽입 *** ----------------------------------
-- ▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽▼▽ --
-----------------------------------------------------------------------------------

-- ** 회원 등록 ** -----------------------------------------------------------------------
-- 관리자MASTER ~ 일반 회원NORMAL, 불량 회원BLACK 삽입 : 포인트는 디폴트 0 이나 임의로 삽입함
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('brain@gmail.com','MASTER','aaaa',sysdate,'MASTER'); -- 관리자 : MASTER
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('a@gmail.com','A맨','aaaa',sysdate, 450, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('b@gmail.com','B맨','aaaa',sysdate, 50, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('c@gmail.com','C맨','aaaa',sysdate, 150, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('d@gmail.com','D맨','aaaa',sysdate, 800, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('e@gmail.com','E맨','aaaa',sysdate, 750, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('f@gmail.com','F맨','aaaa',sysdate, 10, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('g@gmail.com','G맨','aaaa',sysdate, 1150, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('h@gmail.com','H맨','aaaa',sysdate, 1250, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('i@gmail.com','I맨','aaaa',sysdate, 10, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('j@gmail.com','J맨','aaaa',sysdate, 350, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('k@gmail.com','K맨','aaaa',sysdate, 550, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('l@gmail.com','L맨','aaaa',sysdate, 15, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('m@gmail.com','M맨','aaaa',sysdate, 90, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('n@gmail.com','N맨','aaaa',sysdate, 250, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('o@gmail.com','O맨','aaaa',sysdate, 760, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('p@gmail.com','P맨','aaaa',sysdate, 980, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('q@gmail.com','Q맨','aaaa',sysdate, 1000, 'NORMAL'); -- 일반 회원 : NORMAL
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('r@gmail.com','R맨','aaaa',sysdate, 20, 'BLACK'); -- 일반 회원 : BLACK
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('s@gmail.com','S맨','aaaa',sysdate, 80, 'BLACK'); -- 일반 회원 : BLACK
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_POINT, MEMBER_CATEGORY) 
values('t@gmail.com','T맨','aaaa',sysdate, 10, 'BLACK'); -- 일반 회원 : BLACK
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- ** 태그 등록 ** -----------------------------------------------------------------------
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
insert into tag(TAG_NAME) values('공포');
insert into tag(TAG_NAME) values('19');
insert into tag(TAG_NAME) values('SF');
insert into tag(TAG_NAME) values('로맨스');
insert into tag(TAG_NAME) values('무협');
insert into tag(TAG_NAME) values('의식의흐름');
insert into tag(TAG_NAME) values('드라마');
insert into tag(TAG_NAME) values('판타지');
insert into tag(TAG_NAME) values('반전');
insert into tag(TAG_NAME) values('스릴러');
insert into tag(TAG_NAME) values('개드립');
insert into tag(TAG_NAME) values('가족');
insert into tag(TAG_NAME) values('전쟁');
insert into tag(TAG_NAME) values('스포츠');
insert into tag(TAG_NAME) values('게임');
insert into tag(TAG_NAME) values('코미디');
insert into tag(TAG_NAME) values('연애');
insert into tag(TAG_NAME) values('기타');
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
<<<<<<< HEAD
-- ** 주제글등록 ** ---------------------------------------------------------------------
-- 신규 insert : 21개    (     주제글번호        | 작성자이메일    |          주제글제목       |          주제글내용           |     주제글작성날짜    |  주제글완결,신규,베스트여부)
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'a@gmail.com','신규글1 제목','신규글1 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'b@gmail.com','신규글2 제목','신규글2 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'c@gmail.com','신규글3 제목','신규글3 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'d@gmail.com','신규글4 제목','신규글4 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'e@gmail.com','신규글5 제목','신규글5 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'f@gmail.com','신규글6 제목','신규글6 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'g@gmail.com','신규글7 제목','신규글7 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'h@gmail.com','신규글8 제목','신규글8 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'i@gmail.com','신규글9 제목','신규글9 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'j@gmail.com','신규글10 제목','신규글10 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'k@gmail.com','신규글11 제목','신규글11 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'l@gmail.com','신규글12 제목','신규글12 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'m@gmail.com','신규글13 제목','신규글13 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'n@gmail.com','신규글14 제목','신규글14 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'o@gmail.com','신규글15 제목','신규글15 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'p@gmail.com','신규글16 제목','신규글16 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'q@gmail.com','신규글17 제목','신규글17 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'e@gmail.com','신규글18 제목','신규글18 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'a@gmail.com','신규글19 제목','신규글19 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'h@gmail.com','신규글20 제목','신규글20 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'j@gmail.com','신규글22 제목','신규글22 내용', sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
=======
-- ** 주제글 등록 ** ---------------------------------------------------------------------
-- 신규 insert : 21개    (     주제글번호        | 작성자이메일    |          주제글 제목       |          주제글 내용           |     주제글  작성 날짜    |  주제글 완결,신규,베스트 여부)
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'a@gmail.com','신규글1 제목','신규글1 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'b@gmail.com','신규글2 제목','신규글2 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'c@gmail.com','신규글3 제목','신규글3 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'d@gmail.com','신규글4 제목','신규글4 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'e@gmail.com','신규글5 제목','신규글5 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'f@gmail.com','신규글6 제목','신규글6 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'g@gmail.com','신규글7 제목','신규글7 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'h@gmail.com','신규글8 제목','신규글8 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'i@gmail.com','신규글9 제목','신규글9 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'j@gmail.com','신규글10 제목','신규글10 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'k@gmail.com','신규글11 제목','신규글11 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'l@gmail.com','신규글12 제목','신규글12 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'m@gmail.com','신규글13 제목','신규글13 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'n@gmail.com','신규글14 제목','신규글14 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'o@gmail.com','신규글15 제목','신규글15 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'p@gmail.com','신규글16 제목','신규글16 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'q@gmail.com','신규글17 제목','신규글17 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'e@gmail.com','신규글18 제목','신규글18 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'a@gmail.com','신규글19 제목','신규글19 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'h@gmail.com','신규글20 제목','신규글20 내용',sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'j@gmail.com','신규글21 제목','신규글21 내용', sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 0);
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git

<<<<<<< HEAD
-- 베스트 insert : 11개 (     주제글번호        | 작성자이메일    |          주제글제목       |          주제글내용           |      주제글조회수      |   주제글잇자수       |         주제글통합잇자수        |       주제글작성일시    | 주제글완결,신규,베스트여부)
=======
-- 베스트 insert : 11개 (     주제글번호        | 작성자이메일    |          주제글 제목       |          주제글 내용           |      주제글 조회수      |   주제글  잇자수       |         주제글 통합 잇자수        |       주제글 작성일시    | 주제글 완결,신규,베스트 여부)
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'a@gmail.com', '베스트글1 제목', '베스트글1 내용', 25, 20, 30, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'h@gmail.com', '베스트글2 제목', '베스트글2 내용', 55, 35, 45, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'p@gmail.com', '베스트글3 제목', '베스트글3 내용', 49, 39, 59, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'q@gmail.com', '베스트글4 제목', '베스트글4 내용', 85, 65, 90, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'm@gmail.com', '베스트글5 제목', '베스트글5 내용', 35, 12, 21, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'd@gmail.com', '베스트글6 제목', '베스트글6 내용', 20, 10, 12, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'j@gmail.com', '베스트글7 제목', '베스트글7 내용', 45, 19, 34, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'e@gmail.com', '베스트글8 제목', '베스트글8 내용', 59, 13, 26, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'l@gmail.com', '베스트글9 제목', '베스트글9 내용', 85, 26, 39, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'f@gmail.com', '베스트글10 제목', '베스트글10 내용', 115, 35, 85, sysdate, sysdate, -1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'i@gmail.com', '베스트글11 제목', '베스트글11 내용', 85, 17, 46, sysdate, sysdate, -1);

<<<<<<< HEAD
-- 완결 insert : 21개    (     주제글번호        | 작성자이메일    |          주제글제목       |          주제글내용           |      주제글조회수      |   주제글잇자수       |         주제글통합잇자수        |       주제글작성일시    | 주제글완결,신규,베스트여부)
=======
-- 완결 insert : 21개    (     주제글번호        | 작성자이메일    |          주제글 제목       |          주제글 내용           |      주제글 조회수      |   주제글  잇자수       |         주제글 통합 잇자수        |       주제글 작성일시    | 주제글 완결,신규,베스트 여부)
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'a@gmail.com', '완결글1 제목', '완결글1 내용', 615, 125, 230, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'a@gmail.com', '완결글2 제목', '완결글2 내용', 445, 220, 330, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'a@gmail.com', '완결글3 제목', '완결글3 내용', 365, 210, 330, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'f@gmail.com', '완결글4 제목', '완결글4 내용', 595, 250, 430, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'i@gmail.com', '완결글5 제목', '완결글5 내용', 755, 420, 630, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'i@gmail.com', '완결글6 제목', '완결글6 내용', 505, 350, 530, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'j@gmail.com', '완결글7 제목', '완결글7 내용', 755, 98, 650, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'j@gmail.com', '완결글8 제목', '완결글8 내용', 801, 453, 652, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'j@gmail.com', '완결글9 제목', '완결글9 내용', 1005, 456, 759, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'j@gmail.com', '완결글10 제목', '완결글10 내용', 1805, 865, 1059, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'g@gmail.com', '완결글11 제목', '완결글11 내용', 2645, 1046, 1679, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'g@gmail.com', '완결글12 제목', '완결글12 내용', 3565, 2120, 3530, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'g@gmail.com', '완결글13 제목', '완결글13 내용', 3500, 2350, 2930, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'e@gmail.com', '완결글14 제목', '완결글14 내용', 2845, 910, 1830, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'c@gmail.com', '완결글15 제목', '완결글15 내용', 2435, 1020, 1600, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'b@gmail.com', '완결글16 제목', '완결글16 내용', 2145, 1065, 1803, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'j@gmail.com', '완결글17 제목', '완결글17 내용', 3145, 1840, 2430, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'l@gmail.com', '완결글18 제목', '완결글18 내용', 4145, 2620, 3530, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'm@gmail.com', '완결글19 제목', '완결글19 내용', 485, 80, 220, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'm@gmail.com', '완결글20 제목', '완결글20 내용', 805, 120, 190, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);
insert into main_article(MAIN_ARTICLE_NO, MEMBER_EMAIL, MAIN_ARTICLE_TITLE, MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE, MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval, 'e@gmail.com', '완결글21 제목', '완결글21 내용', 355, 120, 230, sysdate, to_date('2015/12/05 00:00:00',  'yyyy/mm/dd hh24:mi:ss'), 1);

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
<<<<<<< HEAD
-- ** 53개주제글번호에맞는태그등록 ** -------------------------------------------------------
=======
-- ** 53개 주제글 번호에 맞는 태그 등록 ** -------------------------------------------------------
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 1);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 1);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 2);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 2);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 3);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 3);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('드라마', 4);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('판타지', 4);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 5);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스릴러', 5);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('개드립', 6);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 6);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 7);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 7);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 8);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 8);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('연애', 9);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('기타', 9);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 10);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 10);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 11);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 11);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 12);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 12);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('드라마', 13);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('판타지', 13);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 14);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스릴러', 14);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('개드립', 15);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 15);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 16);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 16);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 17);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 17);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('연애', 18);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('기타', 18);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 19);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 19);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 20);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 20);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 21);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 21);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('드라마', 22);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('판타지', 22);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 23);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스릴러', 23);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('개드립', 24);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 24);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 25);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 25);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 26);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 26);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('연애', 27);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('기타', 27);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 28);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 28);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 29);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 29);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 30);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 30);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('드라마', 31);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('판타지', 31);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 32);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스릴러', 32);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('개드립', 33);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 33);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 34);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 34);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 35);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 35);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('연애', 36);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('기타', 36);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 37);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 37);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 38);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 38);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 39);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 39);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('드라마', 40);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('판타지', 40);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 41);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스릴러', 41);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('개드립', 42);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 42);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 43);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 43);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 44);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 44);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('연애', 45);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('기타', 45);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 46);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 46);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 47);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 47);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 48);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 48);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('드라마', 49);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('판타지', 49);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 50);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스릴러', 50);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('개드립', 51);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 51);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 52);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 52);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 53);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 53);

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
<<<<<<< HEAD
-- ** 잇는글등록 ** ---------------------------------------------------------------------
-- 베스트 22~32 :     (      주제글번호      |     잇는글번호     |   작성자이메일  |       잇는글단계          |         잇는글내용         |    잇는글잇자수     |   이어진건지  |        등록일자        )        
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(1, sub_article_seq.nextval, 'q@gmail.com', 2,  '잇는글1', 23, 0 , sysdate);
=======
-- ** 잇는글 등록 ** ---------------------------------------------------------------------
-- 베스트 22~32 :     (      주제글 번호      |     잇는글 번호     |   작성자 이메일  |       잇는글 단계          |         잇는 글 내용         |    잇는글 잇자수     |   이어진건지  |        등록일자        )        
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(22, sub_article_seq.nextval, 'q@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(23, sub_article_seq.nextval, 'o@gmail.com', 1,  '잇능균1', 43, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(24, sub_article_seq.nextval, 'e@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(25, sub_article_seq.nextval, 'f@gmail.com', 1,  '잇는글1', 34, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(26, sub_article_seq.nextval, 'g@gmail.com', 1,  '잇는글1', 32, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(27, sub_article_seq.nextval, 'b@gmail.com', 1,  '잇는글1', 26, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(28, sub_article_seq.nextval, 'a@gmail.com', 1,  '잇는글1', 37, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(29, sub_article_seq.nextval, 'c@gmail.com', 1,  '잇는글1', 49, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(30, sub_article_seq.nextval, 'j@gmail.com', 1,  '잇는글1', 59, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(31, sub_article_seq.nextval, 'm@gmail.com', 1,  '잇는글1', 60, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(32, sub_article_seq.nextval, 'n@gmail.com', 1,  '잇는글1', 54, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(23, sub_article_seq.nextval, 'q@gmail.com', 2,  '잇는글2', 38, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(24, sub_article_seq.nextval, 'j@gmail.com', 2,  '잇는글2', 67, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(25, sub_article_seq.nextval, 'm@gmail.com', 2,  '잇는글2', 81, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(26, sub_article_seq.nextval, 'h@gmail.com', 2,  '잇는글2', 73, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(27, sub_article_seq.nextval, 'i@gmail.com', 2,  '잇는글2', 61, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(28, sub_article_seq.nextval, 'l@gmail.com', 2,  '잇는글2', 59, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(29, sub_article_seq.nextval, 'e@gmail.com', 2,  '잇는글2', 64, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(30, sub_article_seq.nextval, 'd@gmail.com', 2,  '잇는글2', 37, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(31, sub_article_seq.nextval, 'a@gmail.com', 2,  '잇는글2', 68, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(32, sub_article_seq.nextval, 'b@gmail.com', 2,  '잇는글2', 90, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(25, sub_article_seq.nextval, 'q@gmail.com', 3,  '잇는글3', 480, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(26, sub_article_seq.nextval, 'f@gmail.com', 3,  '잇는글3', 351, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(27, sub_article_seq.nextval, 'g@gmail.com', 3,  '잇는글3', 320, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(28, sub_article_seq.nextval, 'p@gmail.com', 3,  '잇는글3', 276, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(29, sub_article_seq.nextval, 'o@gmail.com', 3,  '잇는글3', 216, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(30, sub_article_seq.nextval, 'i@gmail.com', 3,  '잇는글3', 196, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(31, sub_article_seq.nextval, 'h@gmail.com', 3,  '잇는글3', 186, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(32, sub_article_seq.nextval, 'i@gmail.com', 3,  '잇는글3', 249, 1 , sysdate);

<<<<<<< HEAD
-- 완결  33~53 :       (      주제글번호      |     잇는글번호     |   작성자이메일  |       잇는글단계          |         잇는글내용         |    잇는글잇자수     |   이어진건지  |        등록일자        )        
=======
-- 완결  33~53 :       (      주제글 번호      |     잇는글 번호     |   작성자 이메일  |       잇는글 단계          |         잇는 글 내용         |    잇는글 잇자수     |   이어진건지  |        등록일자        )        
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(33, sub_article_seq.nextval, 'j@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(34, sub_article_seq.nextval, 'q@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(35, sub_article_seq.nextval, 'l@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(36, sub_article_seq.nextval, 'm@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(37, sub_article_seq.nextval, 'n@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(38, sub_article_seq.nextval, 'a@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(39, sub_article_seq.nextval, 'b@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(40, sub_article_seq.nextval, 'a@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(41, sub_article_seq.nextval, 'j@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(42, sub_article_seq.nextval, 'a@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(43, sub_article_seq.nextval, 'd@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(44, sub_article_seq.nextval, 'e@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(45, sub_article_seq.nextval, 'f@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(46, sub_article_seq.nextval, 'g@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(47, sub_article_seq.nextval, 'j@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(48, sub_article_seq.nextval, 'j@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(49, sub_article_seq.nextval, 'i@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(50, sub_article_seq.nextval, 'h@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(51, sub_article_seq.nextval, 'c@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(52, sub_article_seq.nextval, 'd@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(53, sub_article_seq.nextval, 'e@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(43, sub_article_seq.nextval, 'l@gmail.com', 2,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(33, sub_article_seq.nextval, 'm@gmail.com', 2,  '잇는글1', 23, 1 , sysdate);
insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(38, sub_article_seq.nextval, 'n@gmail.com', 2,  '잇는글1', 23, 1 , sysdate);

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
<<<<<<< HEAD
-- ** 찜목록기본등록 ** ---찜없는사람들 b, c, d, e, f, g---------------------------------------------
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('a@gmail.com',26);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('h@gmail.com',27);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('i@gmail.com',28);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('j@gmail.com',29);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('k@gmail.com',32);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('l@gmail.com',31);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('m@gmail.com',30);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('n@gmail.com',29);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('o@gmail.com',28);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('p@gmail.com',27);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('q@gmail.com',26);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('a@gmail.com',25);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('h@gmail.com',24);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('i@gmail.com',23);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('j@gmail.com',22);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('k@gmail.com',35);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('l@gmail.com',34);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('m@gmail.com',33);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('n@gmail.com',32);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('o@gmail.com',49);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('p@gmail.com',50);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('q@gmail.com',51);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('a@gmail.com',52);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('h@gmail.com',53);
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- ** 랭킹데이터입력 ** ------------------------------------------------------------------
=======
-- ** 찜목록 기본 등록 ** ---찜 없는 사람들 b, c, d, e, f, g---------------------------------------------
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('a@gmail.com',26);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('h@gmail.com',27);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('i@gmail.com',28);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('j@gmail.com',29);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('k@gmail.com',32);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('l@gmail.com',31);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('m@gmail.com',30);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('n@gmail.com',29);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('o@gmail.com',28);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('p@gmail.com',27);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('q@gmail.com',26);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('a@gmail.com',25);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('h@gmail.com',24);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('i@gmail.com',23);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('j@gmail.com',22);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('k@gmail.com',35);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('l@gmail.com',34);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('m@gmail.com',33);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('n@gmail.com',32);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('o@gmail.com',49);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('p@gmail.com',50);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('q@gmail.com',51);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('a@gmail.com',52);
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('h@gmail.com',53);
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- ** 랭킹 데이터 입력 ** ------------------------------------------------------------------
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git

insert into ranking(MEMBER_GRADE, MIN_POINT, MAX_POINT) values('UNRANKED', 0, 49);
insert into ranking(MEMBER_GRADE, MIN_POINT, MAX_POINT) values('BRONZE', 50, 149);
insert into ranking(MEMBER_GRADE, MIN_POINT, MAX_POINT) values('SILVER', 150, 349);
insert into ranking(MEMBER_GRADE, MIN_POINT, MAX_POINT) values('GOLD', 350, 749);
insert into ranking(MEMBER_GRADE, MIN_POINT, MAX_POINT) values('PLATINUM', 750, 1549);
<<<<<<< HEAD
-- DIAMOND 나중에추가
=======
-- DIAMOND 나중에 추가
>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git












