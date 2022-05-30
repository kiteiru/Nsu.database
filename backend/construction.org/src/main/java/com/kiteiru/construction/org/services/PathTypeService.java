package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.PathTypeDto;
import com.kiteiru.construction.org.entities.PathType;
import com.kiteiru.construction.org.mapper.PathTypeMapper;
import com.kiteiru.construction.org.repositories.PathTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PathTypeService {
    private final PathTypeRepository repo;

    private final PathTypeMapper pathTypeMapper;

    @Autowired
    public PathTypeService(PathTypeRepository repo, PathTypeMapper pathTypeMapper) {
        this.repo = repo;
        this.pathTypeMapper = pathTypeMapper;
    }
    public List<PathTypeDto> getAll() {
        List<PathType> pathTypes =  new ArrayList<>(repo.findAll());
        return pathTypeMapper.entitiesToDtos(pathTypes);
    }

    public PathType save(PathType pathType) {
        return repo.save(pathType);
    }
    public void delete(Integer id) {
        repo.deletePathTypeByObjectId(id);
    }
}
