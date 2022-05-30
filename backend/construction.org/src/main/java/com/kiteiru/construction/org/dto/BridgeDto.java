package com.kiteiru.construction.org.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BridgeDto implements BaseDto {
    private Integer objectId;
    private String objectName;
    private String spanType;
}
