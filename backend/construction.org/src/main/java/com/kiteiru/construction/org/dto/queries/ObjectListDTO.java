package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface ObjectListDTO {
    String getManagementName();
    String getSiteName();
    String getObjectName();
    LocalDate getScheduleDeadline();
    String getWorkTypeName();
}
