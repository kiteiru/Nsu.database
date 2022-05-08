package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkTypeByBrigadeRepository extends JpaRepository<WorkTypeByBrigade, Integer> {
}
