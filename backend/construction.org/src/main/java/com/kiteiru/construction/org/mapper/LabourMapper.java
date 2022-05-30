package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.EngineerTechStaffDto;
import com.kiteiru.construction.org.dto.LabourDto;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import com.kiteiru.construction.org.entities.Labour;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class LabourMapper implements BaseMapper<Labour, LabourDto> {
    @Override
    @Mapping(source = "brigade.id", target = "brigadeId")
    @Mapping(source = "worker.surname", target = "workerSurname")
    @Mapping(source = "worker.name", target = "workerName")
    @Mapping(source = "worker.patronymic", target = "workerPatronymic")
    @Mapping(source = "brigade.brigadier.worker.id", target = "brigadeBrigadierId")
    @Mapping(source = "brigade.brigadier.worker.surname", target = "brigadeBrigadierWorkerSurname")
    public abstract LabourDto entityToDto(Labour labour);
}
