package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.EquipmentListDTO;
import com.kiteiru.construction.org.dto.EquipmentOnObjectListDTO;
import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.services.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
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

    @GetMapping(path = "/list")
    public List <EquipmentListDTO> getEquipmentList(@RequestParam(required = false) Integer managementIdParam) {
        return serv.getEquipmentList(managementIdParam);
    }

    @GetMapping(path = "/on_objects")
    public List <EquipmentOnObjectListDTO> getEquipmentOnObjectList(@RequestParam(required = false) Integer objectIdParam,
                                                                    @RequestParam(required = false, name = "startDate")
                                                                    @DateTimeFormat(pattern = "dd.MM.yyyy") Date startDate,
                                                                    @RequestParam(required = false, name = "endDate")
                                                                    @DateTimeFormat(pattern = "dd.MM.yyyy") Date endDate) {
        return serv.getEquipmentOnObjectList(objectIdParam, startDate, endDate);
    }
}
