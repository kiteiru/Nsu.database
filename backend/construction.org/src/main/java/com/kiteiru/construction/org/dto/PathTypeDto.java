package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PathTypeDto implements BaseDto {
    private Integer id;
    private String objectName;
    private Integer laneNum;
    private Double width;
    private Double length;
}
