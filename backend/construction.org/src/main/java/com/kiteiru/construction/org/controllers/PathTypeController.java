package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.PathTypeDto;
import com.kiteiru.construction.org.services.PathTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/path_type")
public class PathTypeController {
    private final PathTypeService serv;

    @Autowired
    public PathTypeController(PathTypeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<PathTypeDto> getAll() {
        return serv.getAll();
    }
}
