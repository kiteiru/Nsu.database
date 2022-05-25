package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Contract;
import com.kiteiru.construction.org.entities.Employer;
import com.kiteiru.construction.org.repositories.EmployerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployerService {
    private final EmployerRepository repo;

    @Autowired
    public EmployerService(EmployerRepository repo) {
        this.repo = repo;
    }
    public List<Employer> getAll() {
        return repo.findAll();
    }

    public Employer save(Employer employer) {
        return repo.save(employer);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
