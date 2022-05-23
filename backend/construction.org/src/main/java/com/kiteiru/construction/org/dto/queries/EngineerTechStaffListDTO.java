package com.kiteiru.construction.org.dto.queries;

import com.kiteiru.construction.org.enums.EngineerTechStaffType;

public interface EngineerTechStaffListDTO {
    String getManagementName();
    String getSiteName();
    String getWorkerSurname();
    String getWorkerName();
    String getWorkerPatronymic();
    EngineerTechStaffType getEngineerTechStaffType();
}
