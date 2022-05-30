package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.BuildingTypeDto;
import com.kiteiru.construction.org.entities.BuildingType;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class BuildingTypeMapper implements BaseMapper<BuildingType, BuildingTypeDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    @Mapping(source = "object.id", target = "objectId")
    public abstract BuildingTypeDto entityToDto(BuildingType buildingType);
}
