package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ResidentialDto;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.PathType;
import com.kiteiru.construction.org.entities.Residential;
import com.kiteiru.construction.org.mapper.ResidentialMapper;
import com.kiteiru.construction.org.repositories.ResidentialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ResidentialService {
    private final ResidentialRepository repo;

    private final ResidentialMapper residentialMapper;

    @Autowired
    public ResidentialService(ResidentialRepository repo, ResidentialMapper residentialMapper) {
        this.repo = repo;
        this.residentialMapper = residentialMapper;
    }
    public List<ResidentialDto> getAll() {
        List<Residential> residentials =  new ArrayList<>(repo.findAll());
        return residentialMapper.entitiesToDtos(residentials);
    }

    public Residential save(Residential residential) {
        return repo.save(residential);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
