package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Bridge;
import com.kiteiru.construction.org.repositories.BridgeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BridgeService {
    private final BridgeRepository repo;

    @Autowired
    public BridgeService(BridgeRepository repo) {
        this.repo = repo;
    }
    public List<Bridge> getAll() {
        return repo.findAll();
    }
}
