package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BridgeDto implements BaseDto {
    private Integer id;
    private String pathTypeObjectName;
    private String spanType;
}
