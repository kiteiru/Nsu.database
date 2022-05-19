package com.kiteiru.construction.org.dto;

import java.sql.Date;

public interface WorkTypeOverDeadlineListDTO {
    String getOrganisationName();
    String getManagementName();
    String getSiteName();
    String getObjectName();
    String getWorkTypeName();
    Date getScheduleDeadline();
    Date getScheduleActualDate();
}
