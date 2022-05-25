package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.LabourDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Labour;
import com.kiteiru.construction.org.services.LabourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping
    public Labour save(@RequestBody Labour labour) {
        return serv.save(labour);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
