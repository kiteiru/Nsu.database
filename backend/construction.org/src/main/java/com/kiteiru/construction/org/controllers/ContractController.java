package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ContractDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Contract;
import com.kiteiru.construction.org.services.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/contract")
public class ContractController {
    private final ContractService serv;

    @Autowired
    public ContractController(ContractService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<ContractDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Contract save(@RequestBody Contract contract) {
        return serv.save(contract);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
