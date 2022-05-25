package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.PathTypeDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.PathType;
import com.kiteiru.construction.org.services.PathTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/path_type")
public class PathTypeController {
    private final PathTypeService serv;

    @Autowired
    public PathTypeController(PathTypeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<PathTypeDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public PathType save(@RequestBody PathType pathType) {
        return serv.save(pathType);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
