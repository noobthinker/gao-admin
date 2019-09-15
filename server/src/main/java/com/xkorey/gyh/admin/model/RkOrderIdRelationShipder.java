package com.xkorey.gyh.admin.model;


import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table
public class RkOrderIdRelationShipder {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private Long sourceId;
  private Long nextId;
  private String idType;

}
