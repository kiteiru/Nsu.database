package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Residential;
import com.kiteiru.construction.org.repositories.ResidentialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResidentialService {
    private final ResidentialRepository repo;

    @Autowired
    public ResidentialService(ResidentialRepository repo) {
        this.repo = repo;
    }
    public List<Residential> getAll() {
        return repo.findAll();
    }
}
