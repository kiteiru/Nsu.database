package com.kiteiru.construction.org.entities;

import com.kiteiru.construction.org.dto.BaseDto;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "nonresidential")
public class Nonresidential implements BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "object_id", nullable = false)
    private Object object;

}