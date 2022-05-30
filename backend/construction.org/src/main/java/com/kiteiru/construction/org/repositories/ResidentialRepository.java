package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Residential;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResidentialRepository extends JpaRepository<Residential, Integer> {
    void deleteResidentialByObjectId(Integer id);
}
