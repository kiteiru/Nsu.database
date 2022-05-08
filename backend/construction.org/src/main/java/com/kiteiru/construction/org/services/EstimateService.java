package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.repositories.EstimateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstimateService {
    private final EstimateRepository repo;

    @Autowired
    public EstimateService(EstimateRepository repo) {
        this.repo = repo;
    }
    public List<Estimate> getAll() {
        return repo.findAll();
    }
}
