package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.repositories.BuildingTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuildingTypeService {
    private final BuildingTypeRepository repo;

    @Autowired
    public BuildingTypeService(BuildingTypeRepository repo) {
        this.repo = repo;
    }
    public List<BuildingType> getAll() {
        return repo.findAll();
    }
}
