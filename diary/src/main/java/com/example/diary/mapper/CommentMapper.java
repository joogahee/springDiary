package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;

@Mapper
public interface CommentMapper {

	//commentList 출력
	List<Comment> selectComment(Map map);
	
	//comment 추가
	int insertComment(Comment comment);
	
	//comment 수정
	int updateComment(Comment comment);
	
	//comment 삭제
	int deleteComment(int commentNo);
	
	//추가, 삭제를 위해 comment 출력
	Comment selectCommentOne(int commentNo);
}
