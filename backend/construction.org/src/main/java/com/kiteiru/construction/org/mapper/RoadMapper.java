package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.RoadDto;
import com.kiteiru.construction.org.entities.Road;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class RoadMapper implements BaseMapper<Road, RoadDto> {
    @Override
    @Mapping(source = "object.id", target = "objectId")
    @Mapping(source = "object.name", target = "objectName")
    public abstract RoadDto entityToDto(Road road);
}
