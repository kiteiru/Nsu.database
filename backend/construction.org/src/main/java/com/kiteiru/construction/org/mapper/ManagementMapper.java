package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.ManagementDto;
import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.entities.Management;
import com.kiteiru.construction.org.entities.Object;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class ManagementMapper implements BaseMapper<Management, ManagementDto> {
    @Override
    @Mapping(source = "organisation.name", target = "organisationName")
    public abstract ManagementDto entityToDto(Management management);
}
