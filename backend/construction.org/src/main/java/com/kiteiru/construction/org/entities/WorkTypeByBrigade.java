package com.kiteiru.construction.org.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "work_type_by_brigade")
public class WorkTypeByBrigade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "work_type_id", nullable = false)
    private Integer workTypeId;

    @Column(name = "brigade_id", nullable = false)
    private Integer brigadeId;

    @Column(name = "object_id", nullable = false)
    private Integer objectId;

}