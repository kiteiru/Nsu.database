package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.EquipmentDto;
import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.entities.Site;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class EquipmentMapper implements BaseMapper<Equipment, EquipmentDto> {
    @Override
    @Mapping(source = "object.name", target = "objectName")
    @Mapping(source = "workType.name", target = "workTypeName")
    public abstract EquipmentDto entityToDto(Equipment equipment);
}
