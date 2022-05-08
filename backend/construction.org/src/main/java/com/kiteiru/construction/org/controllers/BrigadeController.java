package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.services.BrigadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/brigade")
public class BrigadeController {
    private final BrigadeService serv;

    @Autowired
    public BrigadeController(BrigadeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Brigade> getAll() {
        return serv.getAll();
    }
}
