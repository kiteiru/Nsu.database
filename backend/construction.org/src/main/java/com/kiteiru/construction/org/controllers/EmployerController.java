package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Employer;
import com.kiteiru.construction.org.services.EmployerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/employer")
public class EmployerController {
    private final EmployerService serv;

    @Autowired
    public EmployerController(EmployerService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Employer> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Employer save(@RequestBody Employer employer) {
        return serv.save(employer);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
