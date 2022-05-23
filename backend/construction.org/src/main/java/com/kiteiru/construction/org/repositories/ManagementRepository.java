package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.queries.ManagementListDTO;
import com.kiteiru.construction.org.entities.Management;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagementRepository extends JpaRepository<Management, Integer> {
    @Query(value = "SELECT m.name AS managementName," +
            "               s.name AS siteName," +
            "               w.surname AS workerSurname," +
            "               w.name AS workerName," +
            "               w.patronymic AS workerPatronymic" +
            "        FROM Management AS m" +
            "                 INNER JOIN Site AS s ON m.id = s.management.id" +
            "                 INNER JOIN Worker AS w ON s.head.id = w.id")
    List<ManagementListDTO> getManagementList();
}
