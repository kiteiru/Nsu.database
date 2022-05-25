package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ManagementDto;
import com.kiteiru.construction.org.dto.queries.ManagementListDTO;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Management;
import com.kiteiru.construction.org.services.ManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/management")
public class ManagementController {
    private final ManagementService serv;

    @Autowired
    public ManagementController(ManagementService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<ManagementDto> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/list")
    public List <ManagementListDTO> getManagementList() {
        return serv.getManagementList();
    }

    @PostMapping
    public Management save(@RequestBody Management management) {
        return serv.save(management);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
