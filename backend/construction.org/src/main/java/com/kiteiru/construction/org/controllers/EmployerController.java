package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Employer;
import com.kiteiru.construction.org.services.EmployerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/employer")
public class EmployerController {
    private final EmployerService serv;

    @Autowired
    public EmployerController(EmployerService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Employer> getAll() {
        return serv.getAll();
    }
}
