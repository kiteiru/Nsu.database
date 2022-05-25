package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.entities.Site;
import com.kiteiru.construction.org.services.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/site")
public class SiteController {
    private final SiteService serv;

    @Autowired
    public SiteController(SiteService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<SiteDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Site save(@RequestBody Site site) {
        return serv.save(site);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
