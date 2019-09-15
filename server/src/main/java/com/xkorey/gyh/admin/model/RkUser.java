package com.xkorey.gyh.admin.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Table
@Entity
@Data
public class RkUser {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;
  private String mobile;
  private String passwd;
  private String realName;
  private long userStatus;
  private Date createdDate;
  private long createdBy;
  private String loginEmail;
}
