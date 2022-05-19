package com.kiteiru.construction.org.dto;

import com.kiteiru.construction.org.enums.LabourType;

public interface BrigadeListDTO {
    String getObjectName();
    Integer getBrigadeId();
    String getWorkerSurname();
    String getWorkerName();
    String getWorkerPatronymic();
    LabourType getLabourType();
}
