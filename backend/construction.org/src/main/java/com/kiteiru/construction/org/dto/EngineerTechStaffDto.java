package com.kiteiru.construction.org.dto;

import com.kiteiru.construction.org.enums.EngineerTechStaffType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EngineerTechStaffDto implements BaseDto {
    private Integer id;
    private String workerSurname;
    private String workerName;
    private String workerPatronymic;
    private EngineerTechStaffType engineerTechStaffType;
    private Integer headId;
    private String headSurname;
    private String attribute;
}
