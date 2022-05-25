package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.SiteDto;
import com.kiteiru.construction.org.entities.Schedule;
import com.kiteiru.construction.org.entities.Site;
import com.kiteiru.construction.org.mapper.SiteMapper;
import com.kiteiru.construction.org.repositories.SiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SiteService {
    private final SiteRepository repo;

    private final SiteMapper siteMapper;
    @Autowired
    public SiteService(SiteRepository repo, SiteMapper siteMapper) {
        this.repo = repo;
        this.siteMapper = siteMapper;
    }
    public List<SiteDto> getAll() {
        List<Site> sites = new ArrayList<>(repo.findAll());
        return siteMapper.entitiesToDtos(sites);
    }

    public Site save(Site site) {
        return repo.save(site);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
