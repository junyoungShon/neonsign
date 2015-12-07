package org.cobro.neonsign;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.cobro.neonsign.model.BoardDAO;
import org.cobro.neonsign.model.BoardService;
import org.cobro.neonsign.model.MemberService;
import org.cobro.neonsign.vo.ItjaMemberVO;
import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
*    TDD : 테스트 주도 개발(test-driven development, TDD)은 
*            매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
*            
*    JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
*    
*    아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. 
      <!-- spring junit  -->
 <dependency>
           <groupId>org.springframework</groupId>
           <artifactId>spring-test</artifactId>
           <version>${org.springframework-version}</version>            
       </dependency>
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class JunYoungTest {
	@Resource
	private MemberService memberService;
	@Resource
	private BoardService boardService;
	@Resource
	private BoardDAO boardDAO;
	@Resource
	private MainArticleVO mainArticleVO;
	

	@Test
	public void test(){
		SubArticleVO subArticleVO = new SubArticleVO();
		ItjaMemberVO itjaMemberVO = new ItjaMemberVO();
		/*
		insert into main_article
		(MAIN_ARTICLE_NO,MAIN_ARTICLE_EMAIL,MAIN_ARTICLE_TITLE,MAIN_ARTICLE_CONTENT,MAIN_ARTICLE_HIT, 
		MAIN_ARTICLE_LIKE, MAIN_ARTICLE_TOTAL_LIKE, MAIN_ARTICLE_DATE, MAIN_ARTICLE_UPDATE_DATE,MAIN_ARTICLE_COMPLETE) 
		values(main_article_seq.nextval,'e@naver.com','화장실에서 벌어진 일','손을 씻지 않고 나왔다',0, 0, 0, 
		sysdate, to_date('1970/01/01 00:00:00',  'yyyy/mm/dd hh24:mi:ss'),0);
		*/
		/*
		 insert into sub_article(MAIN_ARTICLE_NO, SUB_ARTICLE_NO, MEMBER_EMAIL, SUB_ARTICLE_GRADE, SUB_ARTICLE_CONTENT, SUBARTICLE_LIKE, IS_CONNECT,SUB_ARTICLE_DATE) 
			values(22, sub_article_seq.nextval, 'q@gmail.com', 1,  '잇는글1', 23, 1 , sysdate);
		 */
		//메인 아티클 삽입
		mainArticleVO.setMemberEmail("a@naver.com");
		mainArticleVO.setMainArticleTitle("Junit 테스트");
		mainArticleVO.setMainArticleContent("끼요욧");
		ArrayList<String> list = new ArrayList<String>();
		list.set(0,"#공포");
		list.set(1, "#19");
		TagBoardVO tagBoardVO = new TagBoardVO();
		for(int i=0;i<list.size();i++){
			tagBoardVO.setMainArticleNo(mainArticleVO.getMainArticleNo());
			tagBoardVO.setTagName(list.get(i));
			boardDAO.insertTagBoardVO(tagBoardVO);
		}
		boardService.insertMainArticle(mainArticleVO, list, tagBoardVO);
	}
}
