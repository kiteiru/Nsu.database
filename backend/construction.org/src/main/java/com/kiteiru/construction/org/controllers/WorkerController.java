package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Worker;
import com.kiteiru.construction.org.services.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/worker")
public class WorkerController {
    private final WorkerService serv;

    @Autowired
    public WorkerController(WorkerService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Worker> getAll() {
        return serv.getAll();
    }

    public List<Worker> findBySurname(@Param("surname") String surname) {
        return serv.findBySurname(surname);
    }

    public List<Worker> findByName(@Param("name") String name) {
        return serv.findByName(name);
    }

    public List<Worker> findByPatronymic(@Param("patronymic") String patronymic) {
        return serv.findByPatronymic(patronymic);
    }

    @GetMapping(path = "/getAll")
    public List<Worker> getAllWorkersByName() {
        return serv.getAllWorkersByName();
    }

    @PostMapping
    public Worker save(@RequestBody Worker worker) {
        return serv.save(worker);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
