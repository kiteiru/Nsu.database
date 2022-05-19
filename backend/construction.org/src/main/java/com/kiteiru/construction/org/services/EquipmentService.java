package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.EquipmentListDTO;
import com.kiteiru.construction.org.dto.EquipmentOnObjectListDTO;
import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.repositories.EquipmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Date;
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

    public List<EquipmentListDTO> getEquipmentList(Integer managementIdParam) {
        return repo.getEquipmentList(managementIdParam);
    }

    public List<EquipmentOnObjectListDTO> getEquipmentOnObjectList(Integer objectIdParam,
                                                                   Date startDate,
                                                                   Date endDate) {
        return repo.getEquipmentOnObjectList(objectIdParam, startDate, endDate);
    }
}
