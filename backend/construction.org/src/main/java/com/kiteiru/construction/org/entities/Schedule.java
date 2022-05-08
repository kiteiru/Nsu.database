package com.kiteiru.construction.org.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "schedule")
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "object_id", nullable = false)
    private Integer object;

    @Column(name = "work_type_id", nullable = false)
    private Integer workType;

    @Column(name = "deadline", nullable = false)
    private LocalDate deadline;

    @Column(name = "actual_date")
    private LocalDate actualDate;

}