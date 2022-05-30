package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.BuildingType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BuildingTypeRepository extends JpaRepository<BuildingType, Integer> {
    void deleteBuildingTypeByObjectId(Integer id);
}
