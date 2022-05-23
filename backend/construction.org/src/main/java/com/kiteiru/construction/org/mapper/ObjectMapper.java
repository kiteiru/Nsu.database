package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.entities.Object;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class ObjectMapper implements BaseMapper<Object, ObjectDto> {
    @Override
    @Mapping(source = "site.name", target = "siteName")
    public abstract ObjectDto entityToDto(Object object);
}
