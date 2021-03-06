package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.queries.WorkTypeOverDeadlineListDTO;
import com.kiteiru.construction.org.entities.WorkType;
import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import com.kiteiru.construction.org.repositories.WorkTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkTypeService {
    private final WorkTypeRepository repo;

    @Autowired
    public WorkTypeService(WorkTypeRepository repo) {
        this.repo = repo;
    }
    public List<WorkType> getAll() {
        return repo.findAll();
    }

    public List<WorkTypeOverDeadlineListDTO> getWorkTypeOverDeadlineList(Integer siteIdParam,
                                                                         Integer managementIdParam,
                                                                         Integer organisationIdParam) {
        return repo.getWorkTypeOverDeadlineList(siteIdParam,
                                                managementIdParam,
                                                organisationIdParam);
    }

    public WorkType save(WorkType workType) {
        return repo.save(workType);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
