package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.BuildingTypeDto;
import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Object;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class BuildingTypeMapper implements BaseMapper<BuildingType, BuildingTypeDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    public abstract BuildingTypeDto entityToDto(BuildingType buildingType);
}
