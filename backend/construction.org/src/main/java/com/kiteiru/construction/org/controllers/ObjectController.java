package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.services.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/object")
public class ObjectController {
    private final ObjectService serv;

    @Autowired
    public ObjectController(ObjectService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Object> getAll() {
        return serv.getAll();
    }
}
