package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.WorkType;
import com.kiteiru.construction.org.services.WorkTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/work_type")
public class WorkTypeController {
    private final WorkTypeService serv;

    @Autowired
    public WorkTypeController(WorkTypeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<WorkType> getAll() {
        return serv.getAll();
    }
}