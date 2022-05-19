package com.kiteiru.construction.org.dto;

import java.sql.Date;

public interface WorkTypeByBrigadeInPeriodListDTO {
    String getObjectName();
    Integer getBrigadeId();
    String getWorkTypeName();
    Date getScheduleActualDate();
}
