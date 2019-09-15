package com.xkorey.gyh.admin.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table
@Data
public class RkOrder {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;
  private String orderPeople;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date orderTime;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date orderStartTime;
  private String orderNumber;
  private String orderType;
  private double orderMoney;
  private long feeTimes;
  private long feeTimesLeft;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date orderFinishTime;
  private String bankName;
  private String feeAddress;
  private String bankNumber;
  private double orderYearFee;

}
