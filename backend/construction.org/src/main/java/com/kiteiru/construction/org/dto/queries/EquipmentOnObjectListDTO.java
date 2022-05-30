package com.kiteiru.construction.org.dto.queries;

import java.time.LocalDate;

public interface EquipmentOnObjectListDTO {
    String getEquipmentType();
    Integer getEquipmentNum();
    String getObjectName();
    LocalDate getScheduleActualDate();
    String getWorkTypeName();
}
