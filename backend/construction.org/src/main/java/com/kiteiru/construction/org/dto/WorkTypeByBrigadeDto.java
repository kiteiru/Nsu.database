package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WorkTypeByBrigadeDto implements BaseDto {
    private Integer id;
    private String workTypeName;
    private Integer brigadeId;
    private String objectName;
}
