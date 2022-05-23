package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.EstimateDto;
import com.kiteiru.construction.org.dto.ScheduleDto;
import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.entities.Schedule;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class ScheduleMapper implements BaseMapper<Schedule, ScheduleDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    @Mapping(source = "workType.name", target = "workTypeName")
    public abstract ScheduleDto entityToDto(Schedule schedule);
}
