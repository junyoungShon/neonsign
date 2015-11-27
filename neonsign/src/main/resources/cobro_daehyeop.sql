select SUB_ARTICLE_NO, SUB_ARTICLE_CONTENT from SUB_ARTICLE where MAIN_ARTICLE_NO=2;
select * from SUB_ARTICLE where MAIN_ARTICLE_NO=2;
--주제글 목록
select * from MAIN_ARTICLE;

--완결게시물 추천수순 정렬
select MAIN_ARTICLE_NO, MAIN_ARTICLE_EMAIL,
		MAIN_ARTICLE_TITLE,
		MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT,
		MAIN_ARTICLE_LIKE,
		MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE,
		MAIN_ARTICLE_UPDATE_DATE
		from MAIN_ARTICLE where MAIN_ARTICLE_COMPLETE = 1 order by MAIN_ARTICLE_UPDATE_DATE
		
--관리자 계정 등록
insert into brain_member(MEMBER_EMAIL,MEMBER_NICKNAME,MEMBER_PASSWORD,MEMBER_JOIN_DATE,MEMBER_CATEGORY) 
values('eoguq4384@gmail.com','고대협','koh4384',sysdate,'관리자');

--완결게시물 프록시 등록
insert into main_article
(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, 
MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE,MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'a@naver.com','가나다라마바사아자차카타파하','가나다라마바사! 아자차카타파하!',84, 15, 1, 
sysdate, to_date('2015/11/20 13:51:40',  'yyyy/mm/dd hh24:mi:ss'),1);



