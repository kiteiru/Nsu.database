package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.queries.MaterialOverEstimateListDTO;
import com.kiteiru.construction.org.entities.Management;
import com.kiteiru.construction.org.entities.Material;
import com.kiteiru.construction.org.repositories.MaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialService {
    private final MaterialRepository repo;

    @Autowired
    public MaterialService(MaterialRepository repo) {
        this.repo = repo;
    }
    public List<Material> getAll() {
        return repo.findAll();
    }

    public List<MaterialOverEstimateListDTO> getMaterialOverEstimateList(Integer siteIdParam,
                                                                         Integer managementIdParam,
                                                                         Integer organisationIdParam) {
        return repo.getMaterialOverEstimateList(siteIdParam,
                                                managementIdParam,
                                                organisationIdParam);
    }

    public Material save(Material material) {
        return repo.save(material);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
