package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.RoadDto;
import com.kiteiru.construction.org.entities.Road;
import com.kiteiru.construction.org.services.RoadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/road")
public class RoadController {
    private final RoadService serv;

    @Autowired
    public RoadController(RoadService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<RoadDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Road save(@RequestBody Road road) {
        return serv.save(road);
    }
    @Transactional
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
