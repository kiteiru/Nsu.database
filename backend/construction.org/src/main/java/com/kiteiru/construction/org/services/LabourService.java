package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.LabourDto;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.entities.Labour;
import com.kiteiru.construction.org.mapper.LabourMapper;
import com.kiteiru.construction.org.repositories.LabourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LabourService {
    private final LabourRepository repo;

    private final LabourMapper labourMapper;

    @Autowired
    public LabourService(LabourRepository repo, LabourMapper labourMapper) {
        this.repo = repo;
        this.labourMapper = labourMapper;
    }
    public List<LabourDto> getAll() {
        List<Labour> labours =  new ArrayList<>(repo.findAll());
        return labourMapper.entitiesToDtos(labours);
    }

    public Labour save(Labour labour) {
        return repo.save(labour);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
