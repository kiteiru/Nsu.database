package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.EngineerTechStaffDto;
import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import com.kiteiru.construction.org.entities.Object;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class EngineerTechStaffMapper implements BaseMapper<EngineerTechStaff, EngineerTechStaffDto> {
    @Override
    @Mapping(source = "worker.surname", target = "workerSurname")
    @Mapping(source = "worker.name", target = "workerName")
    @Mapping(source = "worker.patronymic", target = "workerPatronymic")
    @Mapping(source = "head.id", target = "headId")
    @Mapping(source = "head.surname", target = "headSurname")
    public abstract EngineerTechStaffDto entityToDto(EngineerTechStaff engineerTechStaff);
}
