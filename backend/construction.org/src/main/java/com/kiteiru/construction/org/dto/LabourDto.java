package com.kiteiru.construction.org.dto;

import com.kiteiru.construction.org.enums.LabourType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LabourDto implements BaseDto {
    private Integer id;
    private String workerSurname;
    private String workerName;
    private String workerPatronymic;
    private LabourType labourType;
    private Integer brigadeId;
    private Integer brigadeBrigadierId;
    private String brigadeBrigadierWorkerSurname;
    private String attribute;
}
