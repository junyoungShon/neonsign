select MAIN_ARTICLE_NO, MAIN_ARTICLE_EMAIL,
		MAIN_ARTICLE_TITLE,
		MAIN_ARTICLE_CONTENT, MAIN_ARTICLE_HIT,
		MAIN_ARTICLE_LIKE,
		MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE,
		MAIN_ARTICLE_UPDATE_DATE
		from MAIN_ARTICLE where MAIN_ARTICLE_COMPLETE = 1 order by MAIN_ARTICLE_UPDATE_DATE
		
		insert into main_article
(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, 
MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE,MAIN_ARTICLE_COMPLETE) 
values(main_article_seq.nextval,'e@naver.com','화장실에서 벌어진 일','손을 씻지 않고 나왔다',84, 15, 55, 
sysdate, to_date('2015/11/20 13:51:40',  'yyyy/mm/dd hh24:mi:ss'),1);

		select * from main_article m,  brain_member b,sub_article s  where
		m.MAIN_ARTICLE_NO=s.MAIN_ARTICLE_NO and m.MAIN_ARTICLE_NO=2
		and b.MEMBER_EMAIL=m.MAIN_ARTICLE_EMAIL order by s.SUB_ARTICLE_GRADE asc
		
		select * from MAIN_ARTICLE
		select * from ITJA_MEMBER
		select * from sub_article
		select max(SUB_ARTICLE_GRADE)+1 as SUB_ARTICLE_GRADE from sub_article where MAIN_ARTICLE_NO=46 and IS_CONNECT=1
		select count(*) from sub_article where member_email = 'qqqq@qqqq.eee' and SUB_ARTICLE_GRADE =4 and main_article_no = 46