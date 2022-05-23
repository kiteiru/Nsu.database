package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ResidentialDto;
import com.kiteiru.construction.org.services.ResidentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
