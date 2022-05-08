package com.kiteiru.construction.org.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "estimate")
public class Estimate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "object_id", nullable = false)
    private Integer object;

    @Column(name = "material_id", nullable = false)
    private Integer material;

    @Column(name = "material_num", nullable = false)
    private Double materialNum;

    @Column(name = "expenses")
    private Double expenses;

}