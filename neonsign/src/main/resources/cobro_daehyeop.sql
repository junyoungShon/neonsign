select SUB_ARTICLE_NO, SUB_ARTICLE_CONTENT from SUB_ARTICLE where MAIN_ARTICLE_NO=2;
select * from SUB_ARTICLE where MAIN_ARTICLE_NO=2;
--1번 주제글에 있는 잇는글 목록
select * from MAIN_ARTICLE;
--rpd0127@naver.com, ygoyo@naver.com
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'ygoyo@naver.com','그 머리는 똥이었지', 0 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'ygoyo@naver.com','그는 걍 똥이었지', 0 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(1,sub_article_seq.nextval,'ygoyo@naver.com','희이~', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(1,sub_article_seq.nextval,'ygoyo@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(1,sub_article_seq.nextval,'ygoyo@naver.com','키햐학!!', 0 , sysdate);

insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE) 
values(2,sub_article_seq.nextval,'rpd0127@naver.com','키햐학!!', 0 , sysdate);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(2,sub_article_seq.nextval,'rpd0127@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);

-------------------------------------------------------------------------------------------------------------------------------

update SUB_ARTICLE set IS_CONNECT = 0, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=1 and MAIN_ARTICLE_NO=1;
update SUB_ARTICLE set IS_CONNECT = 0, SUBARTICLE_LIKE = 40 where SUB_ARTICLE_NO=7 and MAIN_ARTICLE_NO=1;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 480 where SUB_ARTICLE_NO=8 and MAIN_ARTICLE_NO=1;

update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 980 where SUB_ARTICLE_NO=11 and MAIN_ARTICLE_NO=2;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=10 and MAIN_ARTICLE_NO=2;

-------------------------------------------------------------------------------------------------------------------------------

update MAIN_ARTICLE set MAIN_ARTICLE_LIKE = 10 where MAIN_ARTICLE_NO=1;
update MAIN_ARTICLE set MAIN_ARTICLE_LIKE = 7 where MAIN_ARTICLE_NO=2;

-------------------------------------------------------------------------------------------------------------------------------

-- 이는글 중 끊자로 선택된 이어진글을 가진 주제글 번호
select m.MAIN_ARTICLE_NO
from MAIN_ARTICLE m, SUB_ARTICLE s
where m.MAIN_ARTICLE_NO = s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and IS_END=1;

--이어진글 중 끊자인 이어진글을 가진 주제글의 정보
select m.*
from MAIN_ARTICLE m, SUB_ARTICLE s
where m.MAIN_ARTICLE_NO = s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and IS_END=1;

-------------------------------------------------------------------------------------------------------------------------------

-- 이는글 중 끊자로 선택된 이어진글을 가진 주제글 정보 잇자순
select m.*
from MAIN_ARTICLE m, SUB_ARTICLE s
where m.MAIN_ARTICLE_NO = s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and IS_END=1 order by m.MAIN_ARTICLE_LIKE desc;
-- 이는글 중 끊자로 선택된 이어진글을 가진 주제글 정보 총 잇자순
select m.*
from MAIN_ARTICLE m, SUB_ARTICLE s
where m.MAIN_ARTICLE_NO = s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and IS_END=1 order by m.MAIN_ARTICLE_TOTAL_LIKE desc;
-- 이는글 중 끊자로 선택된 이어진글을 가진 주제글 정보 글쓴날짜순
select m.*
from MAIN_ARTICLE m, SUB_ARTICLE s
where m.MAIN_ARTICLE_NO = s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and IS_END=1 order by m.MAIN_ARTICLE_DATE desc;

<<<<<<< HEAD
--완결게시물 추천수순 정렬
select m.MAIN_ARTICLE_NO, m.MAIN_ARTICLE_EMAIL, MAIN_ARTICLE_TITLE,
		MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT, MAIN_ARTICLE_LIKE,
		MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_COMPLETE_DATE
		from MAIN_ARTICLE m, SUB_ARTICLE s
		where m.MAIN_ARTICLE_NO =
		s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and s.IS_END=1
		order by
		m.MAIN_ARTICLE_TOTAL_LIKE desc;
		
--관리자 계정 등록
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('eoguq4384@gmail.com','고대협','koh4384',sysdate,'관리자');

--완결게시물 프록시 등록
insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'eoguq4384@gmail.com','제성이형의 홀리몰리','크허어올리이!',sysdate);
insert into main_article(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_DATE) 
values(main_article_seq.nextval,'eoguq4384@gmail.com','제성이형의 희맨','희이이이이ㅣ!!!!',sysdate);

insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(6,sub_article_seq.nextval,'rpd0127@naver.com','키햐학!!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(7,sub_article_seq.nextval,'rpd0127@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(8,sub_article_seq.nextval,'rpd0127@naver.com','키햐학!!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(9,sub_article_seq.nextval,'rpd0127@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(10,sub_article_seq.nextval,'rpd0127@naver.com','키햐학!!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(11,sub_article_seq.nextval,'rpd0127@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(12,sub_article_seq.nextval,'rpd0127@naver.com','키햐학!!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(13,sub_article_seq.nextval,'rpd0127@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);
insert into sub_article (MAIN_ARTICLE_NO,SUB_ARTICLE_NO,MEMBER_EMAIL,SUB_ARTICLE_CONTENT,IS_CONNECT,SUB_ARTICLE_DATE, IS_END) 
values(14,sub_article_seq.nextval,'rpd0127@naver.com','글쓴이 죽어라!', 0 , sysdate, 1);

select * from SUB_ARTICLE;

update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 980 where SUB_ARTICLE_NO=21 and MAIN_ARTICLE_NO=11;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=22 and MAIN_ARTICLE_NO=12;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 980 where SUB_ARTICLE_NO=23 and MAIN_ARTICLE_NO=13;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=24 and MAIN_ARTICLE_NO=14;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 980 where SUB_ARTICLE_NO=25 and MAIN_ARTICLE_NO=15;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=26 and MAIN_ARTICLE_NO=16;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 980 where SUB_ARTICLE_NO=27 and MAIN_ARTICLE_NO=17;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=28 and MAIN_ARTICLE_NO=18;
update SUB_ARTICLE set IS_CONNECT = 1, SUBARTICLE_LIKE = 10 where SUB_ARTICLE_NO=29 and MAIN_ARTICLE_NO=19;
=======


select m.MAIN_ARTICLE_NO, m.MAIN_ARTICLE_EMAIL,
		MAIN_ARTICLE_TITLE,
		MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT,
		MAIN_ARTICLE_LIKE,
		MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE,
		MAIN_ARTICLE_COMPLETE_DATE
		from MAIN_ARTICLE m, SUB_ARTICLE s
		where
		m.MAIN_ARTICLE_NO =
		s.MAIN_ARTICLE_NO and s.IS_CONNECT=1 and s.IS_END=1
		order by
		m.MAIN_ARTICLE_TOTAL_LIKE desc


>>>>>>> branch 'master' of https://github.com/junyoungShon/neonsign.git



