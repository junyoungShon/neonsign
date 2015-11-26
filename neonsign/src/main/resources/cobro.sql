/**
 * constraint 제약조건명 foreign key(참조정보저장컬럼명) 
    references 부모테이블(컬럼)
 */
-- main_article의 MAIN_ARTICLE_NO를 자동 생성해주기 위한 시퀀스
create sequence main_article_seq
drop sequence main_article_seq
-- sub_article의 SUB_ARTICLE_NO를 자동 생성해주기 위한 시퀀스
create sequence sub_article_seq
drop sequence sub_article_seq
-- report의 REPORT_NO를 자동 생성해주기 위한 시퀀스
create sequence report_seq

--**회원 데이터 베이스**
create table brain_member(
MEMBER_EMAIL varchar2(50) primary key,
MEMBER_NICKNAME varchar2(20) not null,
MEMBER_PASSWORD varchar2(16) not null,
MEMBER_JOIN_DATE date not null,
MEMBER_POINT number default 0,
MEMBER_NOTIFIED_AMOUNT number default 0,
MEMBER_CATEGORY varchar2(30) not null
)
drop table brain_member;
/*
 * 이메일 : ygoyo@naver.com , 닉네임 : 갓파 , 패스워드 : 1234 ,
 * 가입 날짜 : 현재 날짜 , 포인트 : 0 , 신고수 : 0 , 회원 등급 : 돌
 * 
 * 이메일 : rpd0127@naver.com , 닉네임 : 탑파 , 패스워드 : 1234 ,
 * 가입 날짜 : 현재 날짜 , 포인트 : 0 , 신고수 : 0 , 회원 등급 : 돌
 */
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('a631258@gmail.com','코브라','aaaa',sysdate,'관리자');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('a@naver.com','a맨','aaaa',sysdate,'일반회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('b@naver.com','b맨','aaaa',sysdate,'일반회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('c@naver.com','c맨','aaaa',sysdate,'일반회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('d@naver.com','d맨','aaaa',sysdate,'일반회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('e@naver.com','e맨','aaaa',sysdate,'일반회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('f@naver.com','f맨','aaaa',sysdate,'불량회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('g@naver.com','g맨','aaaa',sysdate,'일반회원');
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('h@naver.com','f맨','aaaa',sysdate,'일반회원');
-- ygoyo@naver.com 회원의 가입 정보 출격
select * from BRAIN_MEMBER;


drop table main_article
--**주제글 데이터베이스**
create table main_article(
	MAIN_ARTICLE_NO number primary key,
	MAIN_ARTICLE_EMAIL varchar2(50) not null,
	MAIN_ARTICLE_TITLE varchar2(60) not null,
	MAIN_ARTICLE_CONTENT varchar2(600) not null,
	MAIN_ARTICLE_HIT number default 0,
	MAIN_ARTICLE_LIKE number default 0,
	MAIN_ARTICLE_TOTAL_LIKE number default 0,
	MAIN_ARTICLE_DATE date not null,
	MAIN_ARTICLE_UPDATE_DATE date,
	MAIN_ARTICLE_COMPLETE number default 0, -- 0미완, 1완
	constraint fk_brain_member foreign key(MAIN_ARTICLE_EMAIL) references brain_member(MEMBER_EMAIL)
)
drop table main_article

/* 글번호 : 현재 시퀀스 넘버 ,
 * ygoyo@naver.com 회원이 글작성
 * 글제목 : 제성이형의 Barin , 내용 : 도대체 무슨 생각을 하는지 모르겠다 , 조회수 : 0
 * 잇자 수 : 0 , 총 잇자 수 : 0 ,작성일 : 현재 날짜 , 완결일 : null
 * 
 * rpd0127@naver.com 회원이 글작성
 * 글제목 : 똥이 마렵지만  , 내용 : 똥이 마렵지만 나는 지금 참고있다 , 조회수 : 0
 * 잇자 수 : 0 , 총 잇자 수 : 0 ,작성일 : 현재 날짜 , 완결일 : null
 */
--신규 게시물 insert
insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'a@naver.com','제성이형의 Barin','도대체 무슨 생각을 하는지 모르겠다',sysdate);

insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'b@naver.com','똥이 마렵지만','똥이 마렵지만 나는 지금 참고있다',sysdate)
--베스트 게시물 insert
insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'c@naver.com','똥이 마렵지만','똥이 마렵지만 나는 지금 참고있다',50, 15, 25, sysdate)

insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'d@naver.com','그와의 은밀한 만남','그런 만남은 없었다',20, 10, 15, sysdate);

insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'a@naver.com','흙을 먹었다','다먹고 나니 나는 돌이 되었다',45, 23, 49, sysdate);

insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'e@naver.com','화장실에서 벌어진 일','손을 씻지 않고 나왔다',84, 15, 55, sysdate);

-- 완결된 게시물 insert

MAIN_ARTICLE_UPDATE_DATE date,
MAIN_ARTICLE_COMPLETE number default 0, -- 0미완, 1완


insert into main_article
(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, 
MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE,MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'e@naver.com','화장실에서 벌어진 일','손을 씻지 않고 나왔다',84, 15, 55, 
sysdate, to_date('2015/11/20 13:51:40',  'yyyy/mm/dd hh24:mi:ss'),1);

insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_COMPLETE_DATE) 
values(main_article_seq.nextval,'c@naver.com','부엉이와 까마귀의 대결','부엉부엉 까악까악 끼룩끼룩',84, 145, 310, sysdate, to_date('2015/10/15 17:51:40',  'yyyy/mm/dd hh24:mi:ss'));


--ygoyo@naver.com 회원의 작성글을 검색
select * from main_article



--**잇는글 데이터베이스** 잇는글 데이터베이스 프라이머리키 문제있음
drop table sub_article
create table sub_article(
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
)
/*
 * ygoyo@naver.com 회원의 1번 게시물에 잇는글을 작성
 * 잇자글 번호 : 현재 시퀀스 넘버 ,
 * 스토리 단계 0 , 잇자 글 내용 :  그 머리는 똥이었지 , 잇자여부 : 0 , 잇자 수 : 0 , 스토리 여부 : 0 , 작성일 : 현재 날짜
 */
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'a@naver.com','그 머리는 똥이었지', 0 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'a@naver.com','머리로 하는 일', 0 , sysdate);

-- 잇자 진행 중 잇는글
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(2, sub_article_seq.nextval, 'a@naver.com', '하이루ㅎㅎㅎ', 8, 0 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(2,sub_article_seq.nextval,'a@naver.com','하이호', 12, 0 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'a@naver.com','머리속에 도청장치가 있습니다 여러분', 22, 0 , sysdate);

-- 끊자 진행 중 잇는글
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_CONTENT, IS_END, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'a@naver.com','머리속에 도청장치가 있습니다 여러분', 1, 22, 0 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_CONTENT, IS_END, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(2,sub_article_seq.nextval,'e@naver.com','내 머리속의 호날두', 1, 12, 0 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_CONTENT, IS_END, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'b@naver.com','니 머리속의 리오넬 메시', 1, 11, 0 , sysdate);
-- 3~5번글에 잇자 만들기
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(3, sub_article_seq.nextval, 'b@naver.com', 1, '잇는다', 23, 1 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(3, sub_article_seq.nextval, 'c@naver.com', 2,  '잇는다고', 33, 1 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(4, sub_article_seq.nextval, 'g@naver.com', 1, '잇는다', 23, 1 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(4, sub_article_seq.nextval, 'h@naver.com', 2,  '잇는다고', 33, 1 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(5, sub_article_seq.nextval, 'd@naver.com', 1, '잇는다', 23, 1 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(5, sub_article_seq.nextval, 'e@naver.com', 2,  '잇는다고', 33, 1 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(6, sub_article_seq.nextval, 'g@naver.com', 1, '잇는다', 13, 1 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(6, sub_article_seq.nextval, 'a@naver.com', 2,  '잇는다고', 33, 1 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(6, sub_article_seq.nextval, 'g@naver.com', 3, '잇는다', 36, 1 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
values(6, sub_article_seq.nextval, 'a@naver.com', 4,  '잇는다고', 43, 1 , sysdate);

--ygoyo@naver.com 회원의 주제글 정보과 잇는글 정보를 검색
select * from main_article m, sub_article s where m.MAIN_ARTICLE_EMAIL=s.MEMBER_EMAIL
select * from sub_article 

--**찜한 게시글 데이터 베이스**
drop table picked_article

create table picked_article(
MEMBER_EMAIL varchar2(50) not null,
MAIN_ARTICLE_NO number not null,
constraint fk_brain_member_pricked foreign key(MEMBER_EMAIL) references brain_member(MEMBER_EMAIL),
constraint fk_main_article_pricked foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint pk_picked primary key(MEMBER_EMAIL,MAIN_ARTICLE_NO)
)

/*
 * ygoyo@naver.com 회원이 2번 게시물을 찜하였다
 */
insert into picked_article(MEMBER_EMAIL,MAIN_ARTICLE_NO) values('ygoyo@naver.com',2)

select * from PICKED_ARTICLE

--ygoyo@naver.com 회원의 찜한 게시물 타이틀
select m.MAIN_ARTICLE_TITLE from picked_article p, main_article m  where p.MEMBER_EMAIL='ygoyo@naver.com' 
and p.MAIN_ARTICLE_NO=m.MAIN_ARTICLE_NO

--**태그 데이터 베이스**
create table tag(
TAG_NAME varchar2(30) primary key,
SEARCH_COUNT number default 0
)
select * from tag
-- tag 등록 (한정된 태그)
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

--#19 #로맨스
-- 공포 태그의 검색횟수 조회 
select SEARCH_COUNT from tag where TAG_NAME='공포'


--**태그한 게시물 데이터 베이스(복합키 적용)**
drop table tag_board
create table tag_board(
TAG_NAME varchar2(30) , 
MAIN_ARTICLE_NO number ,
constraint fk_tag foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_tag_name foreign key(TAG_NAME) references tag(TAG_NAME),
constraint pk_tag_board primary key(TAG_NAME,MAIN_ARTICLE_NO)
)
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('SF', 1);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('반전', 1);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 2);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('로맨스', 2);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('19', 3);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('무협', 3);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('가족', 4);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('전쟁', 4);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('스포츠', 5);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('게임', 5);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('코미디', 6);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('의식의흐름', 6);
insert into tag_board(TAG_NAME, MAIN_ARTICLE_NO) 
values('공포', 7);

--**검색어 데이터 베이스**
create table search_board(
KEYWORD varchar2(30) primary key,
SEARCH_COUNT number not null
)

-- 하지마 **신고 데이터 베이스**
create table report(
REPORT_NO varchar2(30) primary key,
REPORT_DATE date not null,
MAIN_ARTICLE_NO number not null,
SUB_ARTICLE_NO number not null,
REPORT_AMOUNT number default 0,
STAGES_OF_PROCESS varchar2(20), --여부 판단
constraint fk_main_article foreign key(MAIN_ARTICLE_NO) references main_article(MAIN_ARTICLE_NO),
constraint fk_sub_article foreign key(SUB_ARTICLE_NO) references sub_article(SUB_ARTICLE_NO)
)
drop table report
--**신고자 데이터 베이스( 복합키 적용)**
create table reporter(
REPORT_NO varchar2(30) ,
MEMBER_EMAIL varchar2(50),
constraint fk_report foreign key(REPORT_NO) references report(REPORT_NO),
constraint fk_main_article foreign key(MEMBER_EMAIL) references main_article(MEMBER_EMAIL),
constraint pk_reporter primary key(REPORT_NO,MEMBER_EMAIL)
)
drop table reporter
--**랭킹 데이터 베이스**
create table ranking(
MEMBER_GRADE varchar2(30) primary key,
MIN_POINT number not null,
MAX_POINT number not null
)
drop table ranking