package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.BridgeDto;
import com.kiteiru.construction.org.dto.BuildingTypeDto;
import com.kiteiru.construction.org.entities.Bridge;
import com.kiteiru.construction.org.entities.BuildingType;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class BridgeMapper implements BaseMapper<Bridge, BridgeDto> {
    @Override
    @Mapping(source = "pathType.object.name", target = "pathTypeObjectName")
    public abstract BridgeDto entityToDto(Bridge bridge);
}
