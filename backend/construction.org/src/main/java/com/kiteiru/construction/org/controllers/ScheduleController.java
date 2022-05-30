package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ScheduleDto;
import com.kiteiru.construction.org.entities.Schedule;
import com.kiteiru.construction.org.services.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping
    public Schedule save(@RequestBody Schedule schedule) {
        return serv.save(schedule);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
