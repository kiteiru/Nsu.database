package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface WorkTypeOverDeadlineListDTO {
    String getOrganisationName();
    String getManagementName();
    String getSiteName();
    String getObjectName();
    String getWorkTypeName();
    LocalDate getScheduleDeadline();
    LocalDate getScheduleActualDate();
}
