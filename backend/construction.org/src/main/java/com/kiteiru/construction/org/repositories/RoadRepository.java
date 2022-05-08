package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Road;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoadRepository extends JpaRepository<Road, Integer> {
}
