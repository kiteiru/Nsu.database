package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Organisation;
import com.kiteiru.construction.org.services.OrganisationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/organisation")
public class OrganisationController {
    private final OrganisationService serv;

    @Autowired
    public OrganisationController(OrganisationService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Organisation> getAll() {
        return serv.getAll();
    }
}
