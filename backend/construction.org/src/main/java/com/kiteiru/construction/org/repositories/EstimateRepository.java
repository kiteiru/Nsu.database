package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Estimate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EstimateRepository extends JpaRepository<Estimate, Integer> {
}
