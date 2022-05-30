package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Organisation;
import com.kiteiru.construction.org.repositories.OrganisationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganisationService {
    private final OrganisationRepository repo;

    @Autowired
    public OrganisationService(OrganisationRepository repo) {
        this.repo = repo;
    }
    public List<Organisation> getAll() {
        return repo.findAll();
    }

    public Organisation save(Organisation organisation) {
        return repo.save(organisation);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
