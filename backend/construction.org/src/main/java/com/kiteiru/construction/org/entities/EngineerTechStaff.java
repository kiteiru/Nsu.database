package com.kiteiru.construction.org.entities;

import com.kiteiru.construction.org.enums.EngineerTechStaffType;
import com.kiteiru.construction.org.enums.EnumToString;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;

@org.hibernate.annotations.TypeDef(name = "postgresEnum", typeClass = EnumToString.class)

@Getter
@Setter
@Entity
@Table(name = "engineer_tech_staff")
public class EngineerTechStaff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Type(type = "postgresEnum")
    @Column(name = "engineer_tech_staff_type", columnDefinition = "engineer_tech_staff_type not null")
    private EngineerTechStaffType engineerTechStaffType;

    @Column(name = "head_id")
    private Integer headId;

    @Column(name = "attribute")
    private String attribute;
}