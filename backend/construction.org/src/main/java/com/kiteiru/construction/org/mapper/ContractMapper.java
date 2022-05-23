package com.kiteiru.construction.org.mapper;

import com.kiteiru.construction.org.dto.ContractDto;
import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.entities.Contract;
import com.kiteiru.construction.org.entities.Site;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public abstract class ContractMapper implements BaseMapper<Contract, ContractDto> {
    @Override
    @Mapping(source = "employer.name", target = "employerName")
    @Mapping(source = "organisation.name", target = "organisationName")
    public abstract ContractDto entityToDto(Contract contract);
}
