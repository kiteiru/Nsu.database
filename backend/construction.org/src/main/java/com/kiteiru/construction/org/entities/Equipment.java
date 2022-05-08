package com.kiteiru.construction.org.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "equipment")
public class Equipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "num", nullable = false)
    private Integer num;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "object_id", nullable = false)
    private Integer object;

    @Column(name = "work_type_id", nullable = false)
    private Integer workType;

}