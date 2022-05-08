package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Road;
import com.kiteiru.construction.org.repositories.RoadRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoadService {
    private final RoadRepository repo;

    @Autowired
    public RoadService(RoadRepository repo) {
        this.repo = repo;
    }
    public List<Road> getAll() {
        return repo.findAll();
    }
}
