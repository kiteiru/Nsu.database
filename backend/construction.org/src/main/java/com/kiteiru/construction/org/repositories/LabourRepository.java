package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Labour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LabourRepository extends JpaRepository<Labour, Integer> {
}
