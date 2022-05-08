package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Nonresidential;
import com.kiteiru.construction.org.repositories.NonresidentialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NonresidentialService {
    private final NonresidentialRepository repo;

    @Autowired
    public NonresidentialService(NonresidentialRepository repo) {
        this.repo = repo;
    }
    public List<Nonresidential> getAll() {
        return repo.findAll();
    }
}
