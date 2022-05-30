package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.NonresidentialDto;
import com.kiteiru.construction.org.entities.Nonresidential;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class NonresidentialMapper implements BaseMapper<Nonresidential, NonresidentialDto> {
    @Override
    @Mapping(source = "object.id", target = "objectId")
    @Mapping(source = "object.name", target = "objectName")
    public abstract NonresidentialDto entityToDto(Nonresidential nonresidential);
}
