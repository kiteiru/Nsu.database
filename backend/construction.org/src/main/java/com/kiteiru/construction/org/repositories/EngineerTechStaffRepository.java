package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.queries.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EngineerTechStaffRepository extends JpaRepository<EngineerTechStaff, Integer> {

    @Query(value = "SELECT m.name AS managementName," +
            "               s.name AS siteName," +
            "               w.surname AS workerSurname," +
            "               w.name AS workerName," +
            "               w.patronymic AS workerPatronymic," +
            "               e.engineerTechStaffType AS engineerTechStaffType" +
            "        FROM Management AS m" +
            "                 INNER JOIN Site AS s ON m.id = s.management.id" +
            "                 INNER JOIN EngineerTechStaff AS e ON s.head.id = e.headId OR s.head.id = e.id" +
            "                 INNER JOIN Worker AS w ON e.id = w.id" +
            "        WHERE (:siteIdParam IS NOT NULL AND s.id = :siteIdParam OR :siteIdParam IS NULL)")
    List<EngineerTechStaffListDTO> getEngineerTechStaffList(@Param("siteIdParam") Integer siteIdParam);
}
