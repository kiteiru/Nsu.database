package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface ScheduleAndEstimateListDTO {
    String geObjectName();
    LocalDate getScheduleDeadline();
    String getWorkTypeName();
    String getMaterialAndEstimate();
}
