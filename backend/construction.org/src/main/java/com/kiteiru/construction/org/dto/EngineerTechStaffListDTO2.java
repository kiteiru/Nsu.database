package com.kiteiru.construction.org.dto;

import com.kiteiru.construction.org.enums.EngineerTechStaffType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EngineerTechStaffListDTO2 {
    String ManagementName;

    String SiteName;

    String WorkerSurname;

    String WorkerName;

    String WorkerPatronymic;

    EngineerTechStaffType EngineerTechStaffType;
}
