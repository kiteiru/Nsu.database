package com.kiteiru.construction.org.dto.queries;


import java.sql.Date;

public interface EquipmentOnObjectListDTO {
    String getEquipmentType();
    Integer getEquipmentNum();
    String getObjectName();
    Date getScheduleActualDate();
    String getWorkTypeName();
}
