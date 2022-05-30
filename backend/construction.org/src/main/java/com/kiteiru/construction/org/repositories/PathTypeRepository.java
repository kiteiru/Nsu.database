package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.PathType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PathTypeRepository extends JpaRepository<PathType, Integer> {
    void deletePathTypeByObjectId(Integer id);
}
