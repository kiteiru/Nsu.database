package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.EstimateDto;
import com.kiteiru.construction.org.entities.Estimate;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.mapper.EstimateMapper;
import com.kiteiru.construction.org.repositories.EstimateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EstimateService {
    private final EstimateRepository repo;

    private final EstimateMapper estimateMapper;
    @Autowired
    public EstimateService(EstimateRepository repo, EstimateMapper estimateMapper) {
        this.repo = repo;
        this.estimateMapper = estimateMapper;
    }
    public List<EstimateDto> getAll() {
        List<Estimate> estimates =  new ArrayList<>(repo.findAll());
        return estimateMapper.entitiesToDtos(estimates);
    }
}
