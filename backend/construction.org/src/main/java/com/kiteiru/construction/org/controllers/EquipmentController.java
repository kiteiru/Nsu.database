package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.services.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/equipment")
public class EquipmentController {
    private final EquipmentService serv;

    @Autowired
    public EquipmentController(EquipmentService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Equipment> getAll() {
        return serv.getAll();
    }
}
