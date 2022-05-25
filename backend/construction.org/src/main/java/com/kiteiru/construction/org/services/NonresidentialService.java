package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.NonresidentialDto;
import com.kiteiru.construction.org.entities.Material;
import com.kiteiru.construction.org.entities.Nonresidential;
import com.kiteiru.construction.org.entities.Residential;
import com.kiteiru.construction.org.mapper.NonresidentialMapper;
import com.kiteiru.construction.org.repositories.NonresidentialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NonresidentialService {
    private final NonresidentialRepository repo;

    private final NonresidentialMapper nonresidentialMapper;

    @Autowired
    public NonresidentialService(NonresidentialRepository repo, NonresidentialMapper nonresidentialMapper) {
        this.repo = repo;
        this.nonresidentialMapper = nonresidentialMapper;
    }
    public List<NonresidentialDto> getAll() {
        List<Nonresidential> nonresidentials =  new ArrayList<>(repo.findAll());
        return nonresidentialMapper.entitiesToDtos(nonresidentials);
    }

    public Nonresidential save(Nonresidential nonresidential) {
        return repo.save(nonresidential);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
