package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.ResidentialDto;
import com.kiteiru.construction.org.entities.Residential;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class ResidentialMapper implements BaseMapper<Residential, ResidentialDto> {
    @Override
    @Mapping(source = "object.id", target = "objectId")
    @Mapping(source = "object.name", target = "objectName")
    public abstract ResidentialDto entityToDto(Residential residential);
}
