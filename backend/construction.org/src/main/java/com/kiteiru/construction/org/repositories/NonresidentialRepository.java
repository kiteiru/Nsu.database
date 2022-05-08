package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Nonresidential;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NonresidentialRepository extends JpaRepository<Nonresidential, Integer> {
}
