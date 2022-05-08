package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Organisation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganisationRepository extends JpaRepository<Organisation, Integer> {
}
