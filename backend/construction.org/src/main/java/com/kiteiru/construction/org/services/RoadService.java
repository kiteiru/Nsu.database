package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.RoadDto;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.Road;
import com.kiteiru.construction.org.mapper.RoadMapper;
import com.kiteiru.construction.org.repositories.RoadRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoadService {
    private final RoadRepository repo;

    private final RoadMapper roadMapper;

    @Autowired
    public RoadService(RoadRepository repo, RoadMapper roadMapper) {
        this.repo = repo;
        this.roadMapper = roadMapper;
    }
    public List<RoadDto> getAll() {
        List<Road> roads =  new ArrayList<>(repo.findAll());
        return roadMapper.entitiesToDtos(roads);
    }
}
