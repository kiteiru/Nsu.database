package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.NonresidentialDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Nonresidential;
import com.kiteiru.construction.org.services.NonresidentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/nonresidential")
public class NonresidentialController {
    private final NonresidentialService serv;

    @Autowired
    public NonresidentialController(NonresidentialService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<NonresidentialDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Nonresidential save(@RequestBody Nonresidential nonresidential) {
        return serv.save(nonresidential);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
