package com.xkorey.gyh.admin.model;

import javax.persistence.*;

@Entity
@Table
public class RkCommonConf {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  private String commonName;
  private String commonValue;
  private String commonType;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getCommonName() {
    return commonName;
  }

  public void setCommonName(String commonName) {
    this.commonName = commonName;
  }


  public String getCommonValue() {
    return commonValue;
  }

  public void setCommonValue(String commonValue) {
    this.commonValue = commonValue;
  }


  public String getCommonType() {
    return commonType;
  }

  public void setCommonType(String commonType) {
    this.commonType = commonType;
  }

}
