package com.example.diary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Notice;

@Mapper
public interface NoticeMapper {
	// 상세보기
	Notice selectNoticeOne(Notice notice);
	// 입력
	int insertNotice(Notice notice);
	// 삭제
	int deleteNotice(Notice notice);
	// 수정
	int updateNotice(Notice notice);
	// notice 삭제시 comment 유무 확인
	int deleteNoticeCountComment(int noticeNo);
}