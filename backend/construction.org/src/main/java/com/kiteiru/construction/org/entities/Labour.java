package com.kiteiru.construction.org.entities;

import com.kiteiru.construction.org.enums.EnumToString;
import com.kiteiru.construction.org.enums.LabourType;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;

@org.hibernate.annotations.TypeDef(name = "postgresEnum", typeClass = EnumToString.class)
@Getter
@Setter
@Entity
@Table(name = "labour")
public class Labour implements BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id", nullable = false)
    private Worker worker;

    @Enumerated(EnumType.STRING)
    @Type(type = "postgresEnum")
    @Column(name = "labour_type", columnDefinition = "labour_type not null")
    private LabourType labourType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "brigade_id")
    private Brigade brigade;

    @Column(name = "attribute")
    private String attribute;

}