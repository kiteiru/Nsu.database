package com.kiteiru.construction.org.dto.queries;

import java.sql.Date;

public interface ObjectWorkTypeListDTO {
    String getOrganisationName();
    String getManagementName();
    String getObjectName();
    String getWorkTypeName();
    Date getScheduleActualDate();
}
