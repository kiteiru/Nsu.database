package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Contract;
import com.kiteiru.construction.org.repositories.ContractRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContractService {
    private final ContractRepository repo;

    @Autowired
    public ContractService(ContractRepository repo) {
        this.repo = repo;
    }
    public List<Contract> getAll() {
        return repo.findAll();
    }
}
