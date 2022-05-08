package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Employer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployerRepository extends JpaRepository<Employer, Integer> {
}
