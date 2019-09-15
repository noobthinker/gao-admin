package com.xkorey.gyh.admin.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Table
@Entity
@Data
@ToString
public class RkCustomer {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private long sex;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date birthDay;
  private String paperType;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date createdDate;
  private String paper;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date paperAge;
  private String customerSource;
  private String address;
  private String relationShip;
  private String orderType;
  private long feeOrder;
  private long feeRate;
  private String feeOwner;
  private String mobile;
  @NotNull(message = "姓名不能为空")
  private String realName;
  private String note;



}
