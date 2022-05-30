package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface WorkTypeByBrigadeInPeriodListDTO {
    String getObjectName();
    Integer getBrigadeId();
    String getWorkTypeName();
    LocalDate getScheduleActualDate();
}
