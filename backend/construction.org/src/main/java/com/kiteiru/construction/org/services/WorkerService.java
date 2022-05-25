package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Site;
import com.kiteiru.construction.org.entities.Worker;
import com.kiteiru.construction.org.repositories.WorkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkerService {
    private final WorkerRepository repo;

    @Autowired
    public WorkerService(WorkerRepository repo) {
        this.repo = repo;
    }
    public List<Worker> getAll() {
        return repo.findAll();
    }

    public List<Worker> findBySurname(String surname) {
        return repo.findBySurname(surname);
    }

    public List<Worker> findByName(String name) {
        return repo.findByName(name);
    }

    public List<Worker> findByPatronymic(String patronymic) {
        return repo.findByPatronymic(patronymic);
    }

    public List<Worker> getAllWorkersByName() {
        return repo.getAllWorkersByName();
    }

    public Worker save(Worker worker) {
        return repo.save(worker);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
