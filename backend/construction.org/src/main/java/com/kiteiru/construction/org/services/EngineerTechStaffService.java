package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.EngineerTechStaffDto;
import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.queries.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.mapper.EngineerTechStaffMapper;
import com.kiteiru.construction.org.repositories.EngineerTechStaffRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EngineerTechStaffService {
    private final EngineerTechStaffRepository repo;

    private final EngineerTechStaffMapper engineerTechStaffMapper;

    public EngineerTechStaffService(EngineerTechStaffRepository repo, EngineerTechStaffMapper engineerTechStaffMapper) {
        this.repo = repo;
        this.engineerTechStaffMapper = engineerTechStaffMapper;
    }
    public List<EngineerTechStaffDto> getAll() {
        List<EngineerTechStaff> engineerTechStaffs =  new ArrayList<>(repo.findAll());
        return engineerTechStaffMapper.entitiesToDtos(engineerTechStaffs);
    }

    public List<EngineerTechStaffListDTO> getEngineerTechStaffList(Integer siteIdParam) {
        return repo.getEngineerTechStaffList(siteIdParam);
    }
}
