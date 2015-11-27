
		select * from main_article m,  brain_member b,sub_article s  where
		m.MAIN_ARTICLE_NO=s.MAIN_ARTICLE_NO and m.MAIN_ARTICLE_NO=3 
		and b.MEMBER_EMAIL=m.MAIN_ARTICLE_EMAIL
