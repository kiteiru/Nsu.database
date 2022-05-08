package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Equipment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EquipmentRepository extends JpaRepository<Equipment, Integer> {
}
