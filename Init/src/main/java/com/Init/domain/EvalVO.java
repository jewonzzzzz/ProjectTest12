package com.Init.domain;

import lombok.Data;

@Data
public class EvalVO {
	private String eval_his_id;
	private String eval_id;
	private String emp_id;
	private String eval_type;
	private String eval_name;
	private String year;
	private String branch;
	private String eval_report_start;
	private String eval_report_end;
	private String eval_start_date;
	private String eval_end_date;
	private String eval_status;
	private String evaluator;
	private String content;
	private String score_perform;
	private String score_attendance;
	private String score_develop;
	private String score_total;
	private String eval_grade;
	private String comment;
}
