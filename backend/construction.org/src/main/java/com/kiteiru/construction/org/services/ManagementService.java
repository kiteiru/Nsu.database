package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ManagementListDTO;
import com.kiteiru.construction.org.entities.Management;
import com.kiteiru.construction.org.repositories.ManagementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagementService {
    private final ManagementRepository repo;

    @Autowired
    public ManagementService(ManagementRepository repo) {
        this.repo = repo;
    }
    public List<Management> getAll() {
        return repo.findAll();
    }

    public List<ManagementListDTO> getManagementList() {
        return repo.getManagementList();
    }
}
