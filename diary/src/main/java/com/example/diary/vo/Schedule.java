package com.example.diary.vo;

import lombok.Data;

@Data
public class Schedule {
	private int scheduleNo;
	private String memeberId;
	private String scheduleDate;
	private String scheduleMemo;
	private String createdate;
	private String scheduleEmoji;
}
