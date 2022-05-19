package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.EquipmentListDTO;
import com.kiteiru.construction.org.dto.EquipmentOnObjectListDTO;
import com.kiteiru.construction.org.entities.Equipment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Date;
import java.util.List;

@Repository
public interface EquipmentRepository extends JpaRepository<Equipment, Integer> {
    @Query(value = "SELECT e.type AS equipmentType," +
            "               e.num AS equipmentNum," +
            "               o.name AS objectName," +
            "               m.name AS managementName" +
            "        FROM Management AS m" +
            "                 INNER JOIN Site AS s ON s.management = m.id" +
            "                 INNER JOIN Object AS o ON o.site = s.id" +
            "                 INNER JOIN Equipment AS e ON e.object = o.id" +
            "        WHERE (:managementIdParam IS NOT NULL AND m.id = :managementIdParam OR :managementIdParam IS NULL)")
    List<EquipmentListDTO> getEquipmentList(@Param("managementIdParam") Integer managementIdParam);

    @Query(value = "SELECT e.type AS equipmentType," +
            "               e.num AS equipmentNum," +
            "               o.name AS objectName," +
            "               sch.actualDate AS scheduleActualDate," +
            "               wT.name AS workTypeName" +
            "        FROM Management AS m" +
            "                 INNER JOIN Site AS s ON s.management = m.id" +
            "                 INNER JOIN Object AS o ON o.site = s.id" +
            "                 INNER JOIN Equipment AS e ON e.object = o.id" +
            "                 INNER JOIN Schedule AS sch ON o.id = sch.object" +
            "                 INNER JOIN WorkType AS wT ON sch.workType = wT.id AND e.workType = wT.id" +
            "        WHERE (:objectIdParam IS NOT NULL AND o.id = :objectIdParam OR :objectIdParam IS NULL)" +
            "        AND ((:startDate IS NOT NULL AND :endDate IS NOT NULL AND sch.actualDate BETWEEN :startDate AND :endDate AND :startDate <= :endDate)" +
            "            OR (:startDate IS NOT NULL AND :endDate IS NULL AND sch.actualDate >= :startDate)" +
            "            OR (:startDate IS NULL AND :endDate IS NOT NULL AND sch.actualDate <= :endDate)" +
            "            OR (:startDate IS NULL AND :endDate IS NULL))")
    List<EquipmentOnObjectListDTO> getEquipmentOnObjectList(@Param("objectIdParam") Integer objectIdParam,
                                                            @Param("startDate") Date startDate,
                                                            @Param("endDate") Date endDate);
}
