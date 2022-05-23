package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BuildingTypeDto implements BaseDto {
    private Integer id;
    private String objectName;
    private Integer floorNum;
    private Double area;
}
