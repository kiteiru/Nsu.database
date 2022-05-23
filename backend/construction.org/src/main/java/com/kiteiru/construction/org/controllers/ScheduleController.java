package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ScheduleDto;
import com.kiteiru.construction.org.services.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/schedule")
public class ScheduleController {
    private final ScheduleService serv;

    @Autowired
    public ScheduleController(ScheduleService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<ScheduleDto> getAll() {
        return serv.getAll();
    }
}
