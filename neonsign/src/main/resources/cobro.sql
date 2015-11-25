/**
 * constraint 제약조건명 foreign key(참조정보저장컬럼명) 
    references 부모테이블(컬럼)
 */
-- main_article의 MAIN_ARTICLE_NO를 자동 생성해주기 위한 시퀀스
create sequence main_article_seq

-- sub_article의 SUB_ARTICLE_NO를 자동 생성해주기 위한 시퀀스
create sequence sub_article_seq

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

/*
 * 이메일 : ygoyo@naver.com , 닉네임 : 갓파 , 패스워드 : 1234 ,
 * 가입 날짜 : 현재 날짜 , 포인트 : 0 , 신고수 : 0 , 회원 등급 : 돌
 * 
 * 이메일 : rpd0127@naver.com , 닉네임 : 탑파 , 패스워드 : 1234 ,
 * 가입 날짜 : 현재 날짜 , 포인트 : 0 , 신고수 : 0 , 회원 등급 : 돌
 */
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('ygoyo@naver.com','갓파','1234',sysdate,'돌')
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('rpd0127@naver.com','탑파','1234',sysdate,'돌')
-- ygoyo@naver.com 회원의 가입 정보 출격
select * from BRAIN_MEMBER where MEMBER_EMAIL='ygoyo@naver.com'


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
MAIN_ARTICLE_COMPLETE_DATE date,
constraint fk_brain_member foreign key(MAIN_ARTICLE_EMAIL) references brain_member(MEMBER_EMAIL)
)

/* 글번호 : 현재 시퀀스 넘버 ,
 * ygoyo@naver.com 회원이 글작성
 * 글제목 : 제성이형의 Barin , 내용 : 도대체 무슨 생각을 하는지 모르겠다 , 조회수 : 0
 * 잇자 수 : 0 , 총 잇자 수 : 0 ,작성일 : 현재 날짜 , 완결일 : null
 * 
 * rpd0127@naver.com 회원이 글작성
 * 글제목 : 똥이 마렵지만  , 내용 : 똥이 마렵지만 나는 지금 참고있다 , 조회수 : 0
 * 잇자 수 : 0 , 총 잇자 수 : 0 ,작성일 : 현재 날짜 , 완결일 : null
 */
insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'ygoyo@naver.com','제성이형의 Barin','도대체 무슨 생각을 하는지 모르겠다',sysdate)

insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'rpd0127@naver.com','똥이 마렵지만','똥이 마렵지만 나는 지금 참고있다',sysdate)

--ygoyo@naver.com 회원의 작성글을 검색
select * from main_article where MAIN_ARTICLE_EMAIL='ygoyo@naver.com'



--**잇는글 데이터베이스**
create table sub_article(
MAIN_ARTICLE_NO number primary key,
SUB_ARTICLE_NO number not null,
MEMBER_EMAIL varchar2(50) not null, 
SUB_ARTICLE_GRADE number default 0,
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
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'ygoyo@naver.com','그 머리는 똥이었지', 0 , sysdate)

--ygoyo@naver.com 회원의 주제글 정보과 잇는글 정보를 검색
select * from main_article m, sub_article s where m.MAIN_ARTICLE_EMAIL=s.MEMBER_EMAIL


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
-- tag 등록 (한정된 태그)
insert into tag(TAG_NAME) values('소설');
insert into tag(TAG_NAME) values('공포');
insert into tag(TAG_NAME) values('음악');
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


--**검색어 데이터 베이스**
create table search_board(
KEYWORD varchar2(30) primary key,
SEARCH_COUNT number not null,
)

--**신고 데이터 베이스**
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

--**신고자 데이터 베이스( 복합키 적용)**
create table reporter(
REPORT_NO varchar2(30) ,
MEMBER_EMAIL varchar2(50),
constraint fk_report foreign key(REPORT_NO) references report(REPORT_NO),
constraint fk_main_article foreign key(MEMBER_EMAIL) references main_article(MEMBER_EMAIL),
constraint pk_reporter primary key(REPORT_NO,MEMBER_EMAIL)
)

--**랭킹 데이터 베이스**
create table ranking(
MEMBER_GRADE varchar2(30) primary key,
MIN_POINT number not null,
MAX_POINT number not null
)




