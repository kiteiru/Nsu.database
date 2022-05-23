package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.services.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
