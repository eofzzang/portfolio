import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.gasan.domain.DateVO;
import org.gasan.service.ListService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GasanControllerTests {
	
	@Setter(onMethod_ = @Autowired)
	private ListService listService;
	
	@Test
	public void getDateListTest() throws ParseException {
		List<DateVO> dateList = new ArrayList<DateVO>(); //날짜 리스트(현재날짜)
		dateList = listService.getDateList(null);
		String year = Integer.toString(dateList.get(0).getYear()); 
		String month = Integer.toString(dateList.get(0).getMonth());
		String day = Integer.toString(dateList.get(0).getDay());
		System.out.println(year+month+day);
	}

}
