package com.kiteiru.construction.org.dto;

import java.sql.Date;

public interface ObjectListDTO {
    String getManagementName();
    String getSiteName();
    String getObjectName();
    Date getScheduleDeadline();
    String getWorkTypeName();
}
