package com.kiteiru.construction.org.dto.queries;

import java.sql.Date;

public interface ReportListDTO {
    String getObjectName();
    String getWorkTypeName();
    Date getScheduleActualDate();
    String getEstimateExpenses();
}
