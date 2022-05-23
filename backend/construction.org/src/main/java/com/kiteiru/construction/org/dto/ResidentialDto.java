package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ResidentialDto implements BaseDto {
    private Integer id;
    private String buildingTypeObjectName;
    private Integer flatNum;
}
