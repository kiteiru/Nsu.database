package com.kiteiru.construction.org.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoadDto implements BaseDto {
    private Integer objectId;
    private String objectName;
}
