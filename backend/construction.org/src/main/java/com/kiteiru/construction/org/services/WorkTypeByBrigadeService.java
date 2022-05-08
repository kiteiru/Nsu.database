package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import com.kiteiru.construction.org.repositories.WorkTypeByBrigadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}