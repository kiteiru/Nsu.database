package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.EquipmentDto;
import com.kiteiru.construction.org.dto.queries.EquipmentListDTO;
import com.kiteiru.construction.org.dto.queries.EquipmentOnObjectListDTO;
import com.kiteiru.construction.org.entities.Equipment;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.mapper.EquipmentMapper;
import com.kiteiru.construction.org.repositories.EquipmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class EquipmentService {
    private final EquipmentRepository repo;

    private final EquipmentMapper equipmentMapper;
    @Autowired
    public EquipmentService(EquipmentRepository repo, EquipmentMapper equipmentMapper) {
        this.repo = repo;
        this.equipmentMapper = equipmentMapper;
    }
    public List<EquipmentDto> getAll() {
        List<Equipment> equipments =  new ArrayList<>(repo.findAll());
        return equipmentMapper.entitiesToDtos(equipments);
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
