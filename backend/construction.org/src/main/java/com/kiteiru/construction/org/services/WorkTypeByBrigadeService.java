package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.WorkTypeByBrigadeInPeriodListDTO;
import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import com.kiteiru.construction.org.repositories.WorkTypeByBrigadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class WorkTypeByBrigadeService {
    private final WorkTypeByBrigadeRepository repo;

    @Autowired
    public WorkTypeByBrigadeService(WorkTypeByBrigadeRepository repo) {
        this.repo = repo;
    }
    public List<WorkTypeByBrigade> getAll() {
        return repo.findAll();
    }

    public List<WorkTypeByBrigadeInPeriodListDTO> getWorkTypeByBrigadeInPeriodList(Integer brigadeIdParam,
                                                                                   Date startDate,
                                                                                   Date endDate,
                                                                                   Integer objectIdParam) {
        return repo.getWorkTypeByBrigadeInPeriodList(brigadeIdParam,
                                                     startDate,
                                                     endDate,
                                                     objectIdParam);
    }
}
