package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ManagementDto implements BaseDto {
    private Integer id;
    private String name;
    private String organisationName;
}
