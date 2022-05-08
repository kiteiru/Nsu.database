package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Labour;
import com.kiteiru.construction.org.repositories.LabourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LabourService {
    private final LabourRepository repo;

    @Autowired
    public LabourService(LabourRepository repo) {
        this.repo = repo;
    }
    public List<Labour> getAll() {
        return repo.findAll();
    }
}
