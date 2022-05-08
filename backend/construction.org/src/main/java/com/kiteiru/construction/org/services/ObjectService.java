package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.repositories.ObjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ObjectService {
    private final ObjectRepository repo;

    @Autowired
    public ObjectService(ObjectRepository repo) {
        this.repo = repo;
    }
    public List<Object> getAll() {
        return repo.findAll();
    }
}
