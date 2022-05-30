package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.EquipmentDto;
import com.kiteiru.construction.org.dto.queries.EquipmentListDTO;
import com.kiteiru.construction.org.dto.queries.EquipmentOnObjectListDTO;
import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.services.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.time.LocalDate;
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
    public List<EquipmentDto> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/list")
    public List <EquipmentListDTO> getEquipmentList(@RequestParam(required = false) Integer managementIdParam) {
        return serv.getEquipmentList(managementIdParam);
    }

    @GetMapping(path = "/on_objects")
    public List <EquipmentOnObjectListDTO> getEquipmentOnObjectList(@RequestParam(required = false) Integer objectIdParam,
                                                                    @RequestParam(required = false) LocalDate startDate,
                                                                    @RequestParam(required = false) LocalDate endDate) {
        return serv.getEquipmentOnObjectList(objectIdParam, startDate, endDate);
    }

    @PostMapping
    public Equipment save(@RequestBody Equipment equipment) {
        return serv.save(equipment);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
