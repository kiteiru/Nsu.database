package com.kiteiru.construction.org.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "building_type")
public class BuildingType implements BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "floor_num", nullable = false)
    private Integer floorNum;

    @Column(name = "area", nullable = false)
    private Double area;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "object_id", nullable = false)
    private Object object;

}