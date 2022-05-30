package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.BuildingTypeDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.services.BuildingTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/building_type")
public class BuildingTypeController {
    private final BuildingTypeService serv;

    @Autowired
    public BuildingTypeController(BuildingTypeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<BuildingTypeDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public BuildingType save(@RequestBody BuildingType buildingType) {
        return serv.save(buildingType);
    }
    @Transactional
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
