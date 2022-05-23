package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.NonresidentialDto;
import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.ResidentialDto;
import com.kiteiru.construction.org.entities.Nonresidential;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.Residential;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class NonresidentialMapper implements BaseMapper<Nonresidential, NonresidentialDto> {
    @Override
    @Mapping(source = "buildingType.object.name", target = "buildingTypeObjectName")
    public abstract NonresidentialDto entityToDto(Nonresidential nonresidential);
}
