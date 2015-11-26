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









