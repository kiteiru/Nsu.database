package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EstimateDto implements BaseDto {
    private Integer id;
    private String objectName;
    private String materialName;
    private Double materialNum;
    private Double expenses;
}
