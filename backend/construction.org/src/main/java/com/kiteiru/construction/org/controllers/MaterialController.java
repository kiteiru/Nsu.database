package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Material;
import com.kiteiru.construction.org.services.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/material")
public class MaterialController {
    private final MaterialService serv;

    @Autowired
    public MaterialController(MaterialService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Material> getAll() {
        return serv.getAll();
    }
}
