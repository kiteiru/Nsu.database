package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.dto.WorkTypeByBrigadeDto;
import com.kiteiru.construction.org.entities.Site;
import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class WorkTypeByBrigadeMapper implements BaseMapper<WorkTypeByBrigade, WorkTypeByBrigadeDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    @Mapping(source = "workType.name", target = "workTypeName")
    public abstract WorkTypeByBrigadeDto entityToDto(WorkTypeByBrigade workTypeByBrigade);
}
