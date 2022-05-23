package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.RoadDto;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.Road;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class RoadMapper implements BaseMapper<Road, RoadDto> {
    @Override
    @Mapping(source = "pathType.object.name", target = "pathTypeObjectName")
    public abstract RoadDto entityToDto(Road road);
}
