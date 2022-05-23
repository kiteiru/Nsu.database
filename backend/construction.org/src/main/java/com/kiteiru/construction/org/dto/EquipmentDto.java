package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EquipmentDto implements BaseDto {
    private Integer id;
    private Integer num;
    private String type;
    private String objectName;
    private String workTypeName;
}
