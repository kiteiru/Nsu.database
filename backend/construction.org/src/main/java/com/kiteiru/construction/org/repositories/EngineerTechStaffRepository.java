package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO2;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EngineerTechStaffRepository extends JpaRepository<EngineerTechStaff, Integer> {

    @Query(value = "SELECT m.name," +
            "               s.name," +
            "               w.surname," +
            "               w.name," +
            "               w.patronymic," +
            "               e.engineerTechStaffType" +
            "        FROM Management AS m" +
            "                 INNER JOIN Site AS s ON m.id = s.management" +
            "                 INNER JOIN EngineerTechStaff AS e ON s.headId = e.headId OR s.headId = e.id" +
            "                 INNER JOIN Worker AS w ON e.id = w.id" +
            "        WHERE (:site_id_param IS NOT NULL AND s.id = :site_id_param OR :site_id_param IS NULL)")
    List<EngineerTechStaffListDTO2> GetEngineerTechWorkers(@Param("site_id_param") Integer site_id_param);
}
