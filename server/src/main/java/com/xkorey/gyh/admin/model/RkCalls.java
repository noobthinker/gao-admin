package com.xkorey.gyh.admin.model;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table
@Data
public class RkCalls {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String orderPeopleName;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date serviceTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date nextServiceTime;
  private String serviceType;
  private long callTimes;
  private String gift;
  private String agreeOrder;
  private String agreeSuggest;
  private String manner;
  private String agreeMeet;
  private String agreeWx;
  private String callNote;

}
