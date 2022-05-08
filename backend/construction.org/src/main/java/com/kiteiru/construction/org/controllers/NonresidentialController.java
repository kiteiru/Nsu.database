package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Nonresidential;
import com.kiteiru.construction.org.services.NonresidentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public List<Nonresidential> getAll() {
        return serv.getAll();
    }
}
