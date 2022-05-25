package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ResidentialDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Residential;
import com.kiteiru.construction.org.services.ResidentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/residential")
public class ResidentialController {
    private final ResidentialService serv;

    @Autowired
    public ResidentialController(ResidentialService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<ResidentialDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Residential save(@RequestBody Residential residential) {
        return serv.save(residential);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
