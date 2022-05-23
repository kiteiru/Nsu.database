package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.PathTypeDto;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.PathType;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class PathTypeMapper implements BaseMapper<PathType, PathTypeDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    public abstract PathTypeDto entityToDto(PathType pathType);

}
