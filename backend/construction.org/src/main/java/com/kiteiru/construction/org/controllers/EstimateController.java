package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.services.EstimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/estimate")
public class EstimateController {
    private final EstimateService serv;

    @Autowired
    public EstimateController(EstimateService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Estimate> getAll() {
        return serv.getAll();
    }
}
