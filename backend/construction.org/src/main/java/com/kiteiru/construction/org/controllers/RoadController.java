package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.RoadDto;
import com.kiteiru.construction.org.services.RoadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/road")
public class RoadController {
    private final RoadService serv;

    @Autowired
    public RoadController(RoadService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<RoadDto> getAll() {
        return serv.getAll();
    }
}
