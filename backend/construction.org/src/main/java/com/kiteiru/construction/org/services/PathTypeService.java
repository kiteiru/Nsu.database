package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.PathType;
import com.kiteiru.construction.org.repositories.PathTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PathTypeService {
    private final PathTypeRepository repo;

    @Autowired
    public PathTypeService(PathTypeRepository repo) {
        this.repo = repo;
    }
    public List<PathType> getAll() {
        return repo.findAll();
    }
}
