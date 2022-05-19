package com.kiteiru.construction.org.dto;

import java.sql.Date;

public interface ScheduleAndEstimateListDTO {
    String geObjectName();
    Date getScheduleDeadline();
    String getWorkTypeName();
    String getMaterialAndEstimate();
}
