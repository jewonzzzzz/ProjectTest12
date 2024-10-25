package com.Init.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class attVO {
	private String emp_id;
	private String workform_status;
	private String att_start;
	private String att_end;
	private String check_in;
	private String check_out;
	private List<LocalDate> attdays;
	
}
