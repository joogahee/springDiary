package com.example.diary.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class CalendarService {
	
	public Map<String, Object> getCalendar(Integer targetYear, Integer targetMonth) {
		
		//타겟 월의 1일
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.DATE, 1);
		
		if(targetYear != null && targetMonth != null) {
			firstDay.set(Calendar.YEAR, targetYear);
			firstDay.set(Calendar.MONTH, targetMonth);
			
		}
		

		//1월에서 -1, 12 +1 이 되면 CalendarAPI에서 자동으로 년과 월이 변경된다
		targetYear = firstDay.get(Calendar.YEAR);
		targetMonth = firstDay.get(Calendar.MONTH);
		
		
		//활성화 되어 있는 가장큰 필드값
		//lastDate는 API를 통해서 구한다
		int lastDate = firstDay.getActualMaximum(Calendar.DATE);
		
		//1일과 lastDate를 이용하여 앞뒤공백(blank)수 구한다
		int beginBlank = firstDay.get(Calendar.DAY_OF_WEEK) - 1;
		int endBlank = 0;
		if((beginBlank + lastDate) % 7 != 0) {
			endBlank = 7 - ((beginBlank + lastDate) % 7);
		}
		
		//전체 TD의 수
		int totalTd = beginBlank + lastDate + endBlank;
		
		//map에 넣어서 보내주기
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("targetYear",targetYear );
		resultMap.put("targetMonth",targetMonth );
		resultMap.put("lastDate",lastDate );
		resultMap.put("beginBlank",beginBlank );
		resultMap.put("endBlank",endBlank );
		resultMap.put("totalTd",totalTd );
		
		//map 디버깅
		System.out.println(resultMap + " <- resultMap");
			
		return resultMap;
	}

}
