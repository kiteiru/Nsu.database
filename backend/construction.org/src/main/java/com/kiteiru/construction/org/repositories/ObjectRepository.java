package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Object;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ObjectRepository extends JpaRepository<Object, Integer> {
}
