package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface ReportListDTO {
    String getObjectName();
    String getWorkTypeName();
    LocalDate getScheduleActualDate();
    String getEstimateExpenses();
}
