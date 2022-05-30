package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface BrigadeByWorkTypeInPeriodListDTO {
    String getObjectName();
    Integer getBrigadeId();
    String getWorkTypeName();
    LocalDate getScheduleActualDate();
}
