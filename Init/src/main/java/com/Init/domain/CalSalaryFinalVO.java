package com.Init.domain;

import lombok.Data;

@Data
public class CalSalaryFinalVO {
	private int sal_final_id;
	private String sal_list_id;
	private String emp_id;
	private String emp_name;
	private String dname;
	private String dgrade;
	private String emp_position;
	private String emp_job;
	private String emp_work_type;
	private String year;
	private String month;
	private String sal_type;
	private int dgrade_rate;
	private int sal_position;
	private int sal_job;
	private int sal_allow;
	private int sal_month;
	private int sal_perform;
	private int perform_rate;
	private int sal_bonus;
	private int sal_bonus_rate;
	private int sal_total_before;
	private int incometax;
	private int pension;
	private int heal_ins;
	private int long_ins;
	private int emp_ins;
	private int sal_total_deduct;
	private int sal_total_after;
}
