package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Brigade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrigadeRepository extends JpaRepository<Brigade, Integer> {
}
