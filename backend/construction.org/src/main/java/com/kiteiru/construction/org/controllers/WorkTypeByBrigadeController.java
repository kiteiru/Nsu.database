package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import com.kiteiru.construction.org.services.WorkTypeByBrigadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/work_type_by_brigade")
public class WorkTypeByBrigadeController {
    private final WorkTypeByBrigadeService serv;

    @Autowired
    public WorkTypeByBrigadeController(WorkTypeByBrigadeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<WorkTypeByBrigade> getAll() {
        return serv.getAll();
    }
}
