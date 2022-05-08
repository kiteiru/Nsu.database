package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Site;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SiteRepository extends JpaRepository<Site, Integer> {
}
