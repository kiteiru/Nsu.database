package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Bridge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BridgeRepository extends JpaRepository<Bridge, Integer> {
    void deleteBridgeByObjectId(Integer id);
}
