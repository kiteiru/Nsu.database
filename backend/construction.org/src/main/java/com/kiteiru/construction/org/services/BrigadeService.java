package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.repositories.BrigadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrigadeService {
    private final BrigadeRepository repo;

    @Autowired
    public BrigadeService(BrigadeRepository repo) {
        this.repo = repo;
    }
    public List<Brigade> getAll() {
        return repo.findAll();
    }
}
