package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.WorkType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkTypeRepository extends JpaRepository<WorkType, Integer> {
}
