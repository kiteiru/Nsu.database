package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.BridgeDto;
import com.kiteiru.construction.org.entities.Bridge;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class BridgeMapper implements BaseMapper<Bridge, BridgeDto> {
    @Override
    @Mapping(source = "object.id", target = "objectId")
    @Mapping(source = "object.name", target = "objectName")
    public abstract BridgeDto entityToDto(Bridge bridge);
}
