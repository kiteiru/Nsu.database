package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.BuildingTypeDto;
import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.mapper.BuildingTypeMapper;
import com.kiteiru.construction.org.repositories.BuildingTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingTypeService {
    private final BuildingTypeRepository repo;

    private final BuildingTypeMapper buildingTypeMapper;
    @Autowired
    public BuildingTypeService(BuildingTypeRepository repo, BuildingTypeMapper buildingTypeMapper) {
        this.repo = repo;
        this.buildingTypeMapper = buildingTypeMapper;
    }
    public List<BuildingTypeDto> getAll() {
        List<BuildingType> buildingTypes = new ArrayList<>(repo.findAll());
        return buildingTypeMapper.entitiesToDtos(buildingTypes);
    }

    public BuildingType save(BuildingType buildingType) {
        return repo.save(buildingType);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
