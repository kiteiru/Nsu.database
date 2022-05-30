package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface ObjectWorkTypeListDTO {
    String getOrganisationName();
    String getManagementName();
    String getObjectName();
    String getWorkTypeName();
    LocalDate getScheduleActualDate();
}
