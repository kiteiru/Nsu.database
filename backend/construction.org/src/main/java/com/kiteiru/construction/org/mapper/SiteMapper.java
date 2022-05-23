package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.entities.Site;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class SiteMapper implements BaseMapper<Site, SiteDto> {
    @Override
    @Mapping(source = "management.name", target = "managementName")
    @Mapping(source = "head.surname", target = "headSurname")
    public abstract SiteDto entityToDto(Site site);
}
