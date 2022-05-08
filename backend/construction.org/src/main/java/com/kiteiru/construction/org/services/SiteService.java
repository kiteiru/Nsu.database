package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Site;
import com.kiteiru.construction.org.repositories.SiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SiteService {
    private final SiteRepository repo;

    @Autowired
    public SiteService(SiteRepository repo) {
        this.repo = repo;
    }
    public List<Site> getAll() {
        return repo.findAll();
    }
}
