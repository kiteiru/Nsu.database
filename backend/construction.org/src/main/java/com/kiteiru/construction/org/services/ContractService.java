package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ContractDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Contract;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.mapper.ContractMapper;
import com.kiteiru.construction.org.repositories.ContractRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ContractService {
    private final ContractRepository repo;

    private final ContractMapper contractMapper;
    @Autowired
    public ContractService(ContractRepository repo, ContractMapper contractMapper) {
        this.repo = repo;
        this.contractMapper = contractMapper;
    }
    public List<ContractDto> getAll() {
        List<Contract> contracts =  new ArrayList<>(repo.findAll());
        return contractMapper.entitiesToDtos(contracts);
    }

    public Contract save(Contract contract) {
        return repo.save(contract);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
