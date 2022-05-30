package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.EstimateDto;
import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.services.EstimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/estimate")
public class EstimateController {
    private final EstimateService serv;

    @Autowired
    public EstimateController(EstimateService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<EstimateDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Estimate save(@RequestBody Estimate estimate) {
        return serv.save(estimate);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
