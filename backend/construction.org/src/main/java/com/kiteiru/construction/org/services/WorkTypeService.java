package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.WorkType;
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
}
