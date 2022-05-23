package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.controllers.EstimateController;
import com.kiteiru.construction.org.dto.EstimateDto;
import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.entities.Object;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class EstimateMapper implements BaseMapper<Estimate, EstimateDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    @Mapping(source = "material.name", target = "materialName")
    public abstract EstimateDto entityToDto(Estimate estimate);
}
