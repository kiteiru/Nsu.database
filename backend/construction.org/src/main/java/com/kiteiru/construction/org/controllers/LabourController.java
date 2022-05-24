package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.LabourDto;
import com.kiteiru.construction.org.services.LabourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/labour")
public class LabourController {
    private final LabourService serv;

    @Autowired
    public LabourController(LabourService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<LabourDto> getAll() {
        return serv.getAll();
    }
}
