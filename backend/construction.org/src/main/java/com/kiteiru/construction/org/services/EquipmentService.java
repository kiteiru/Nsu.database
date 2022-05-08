package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.repositories.EquipmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentService {
    private final EquipmentRepository repo;

    @Autowired
    public EquipmentService(EquipmentRepository repo) {
        this.repo = repo;
    }
    public List<Equipment> getAll() {
        return repo.findAll();
    }
}
