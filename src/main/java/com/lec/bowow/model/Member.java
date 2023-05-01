package com.lec.bowow.model;
import java.sql.Date;

import lombok.Data;
@Data
public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberPost;
	private String memberAddr1;
	private String memberAddr2;
	private Date memberBirth;
	private int memberAmount;
	private int memberPoint;
	private int gradeno;
	private int startRow;
	private int endRow;
}
