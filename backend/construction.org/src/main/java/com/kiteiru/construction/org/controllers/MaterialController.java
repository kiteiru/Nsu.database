package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.queries.MaterialOverEstimateListDTO;
import com.kiteiru.construction.org.entities.Material;
import com.kiteiru.construction.org.services.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/material")
public class MaterialController {
    private final MaterialService serv;

    @Autowired
    public MaterialController(MaterialService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Material> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/over_estimate")
    public List<MaterialOverEstimateListDTO> getMaterialOverEstimateList(@RequestParam(required = false) Integer siteIdParam,
                                                                         @RequestParam(required = false) Integer managementIdParam,
                                                                         @RequestParam(required = false) Integer organisationIdParam) {
        return serv.getMaterialOverEstimateList(siteIdParam,
                                                managementIdParam,
                                                organisationIdParam);
    }

    @PostMapping
    public Material save(@RequestBody Material material) {
        return serv.save(material);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
