package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO2;
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

    public List<EngineerTechStaffListDTO2> GetEngineerTechWorkers(Integer site_id_param) {
        return repo.GetEngineerTechWorkers(site_id_param);
    }
}
