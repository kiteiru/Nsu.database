package com.kiteiru.construction.org.entities;

import com.kiteiru.construction.org.dto.BaseDto;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "bridge")
public class Bridge implements BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id", nullable = false)
    private PathType pathType;

    @Column(name = "span_type", nullable = false)
    private String spanType;

}