package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ManagementDto;
import com.kiteiru.construction.org.dto.queries.ManagementListDTO;
import com.kiteiru.construction.org.entities.Management;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.mapper.ManagementMapper;
import com.kiteiru.construction.org.repositories.ManagementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ManagementService {
    private final ManagementRepository repo;

    private final ManagementMapper managementMapper;

    @Autowired
    public ManagementService(ManagementRepository repo, ManagementMapper managementMapper) {
        this.repo = repo;
        this.managementMapper = managementMapper;
    }
    public List<ManagementDto> getAll() {
        List<Management> managements =  new ArrayList<>(repo.findAll());
        return managementMapper.entitiesToDtos(managements);
    }

    public List<ManagementListDTO> getManagementList() {
        return repo.getManagementList();
    }
}
