package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.BrigadeDto;
import com.kiteiru.construction.org.dto.EngineerTechStaffDto;
import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class BrigadeMapper implements BaseMapper<Brigade, BrigadeDto> {
    @Override
    @Mapping(source = "brigadier.worker.id", target = "brigadierWorkerId")
    @Mapping(source = "brigadier.worker.surname", target = "brigadierWorkerSurname")
    @Mapping(source = "brigadier.worker.name", target = "brigadierWorkerName")
    @Mapping(source = "brigadier.worker.patronymic", target = "brigadierWorkerPatronymic")
    @Mapping(source = "brigadier.attribute", target = "brigadierAttribute")
    public abstract BrigadeDto entityToDto(Brigade brigade);
}
