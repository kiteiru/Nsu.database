package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import com.kiteiru.construction.org.repositories.EngineerTechStaffRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EngineerTechStaffService {
    private final EngineerTechStaffRepository repo;

    @Autowired
    public EngineerTechStaffService(EngineerTechStaffRepository repo) {
        this.repo = repo;
    }
    public List<EngineerTechStaff> getAll() {
        return repo.findAll();
    }

    public List<EngineerTechStaffListDTO> getEngineerTechStaffList(Integer siteIdParam) {
        return repo.getEngineerTechStaffList(siteIdParam);
    }
}
