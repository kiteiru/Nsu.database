package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.queries.WorkTypeByBrigadeInPeriodListDTO;
import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import java.time.LocalDate;
import java.util.List;

@Repository
public interface WorkTypeByBrigadeRepository extends JpaRepository<WorkTypeByBrigade, Integer> {

    @Query(value = "SELECT o.name AS objectName," +
            "               b.id AS brigadeId," +
            "               wT.name AS workTypeName," +
            "               sch.actualDate AS scheduleActualDate" +
            "        FROM WorkTypeByBrigade AS wTbB" +
            "                 INNER JOIN Object AS o ON wTbB.object.id = o.id" +
            "                 INNER JOIN Schedule AS sch ON wTbB.object.id = sch.object.id AND wTbB.workType.id = sch.workType.id" +
            "                 INNER JOIN Brigade AS b ON wTbB.brigadeId = b.id" +
            "                 INNER JOIN WorkType AS wT ON wT.id = sch.workType.id" +
            "        WHERE ((:brigadeIdParam IS NOT NULL AND b.id = :brigadeIdParam OR :brigadeIdParam IS NULL)" +
            "          AND ((:startDate IS NOT NULL AND :endDate IS NOT NULL AND sch.actualDate BETWEEN :startDate AND :endDate AND :startDate <= :endDate)" +
            "                OR (:startDate IS NOT NULL AND :endDate IS NULL AND sch.actualDate >= :startDate)" +
            "                OR (:startDate IS NULL AND :endDate IS NOT NULL AND sch.actualDate <= :endDate)" +
            "                OR (:startDate IS NULL AND :endDate IS NULL))" +
            "          AND (:objectIdParam IS NOT NULL AND o.id = :objectIdParam OR :objectIdParam IS NULL))" +
            "        ORDER BY o.name")
    List<WorkTypeByBrigadeInPeriodListDTO> getWorkTypeByBrigadeInPeriodList(@Param("brigadeIdParam") Integer brigadeIdParam,
                                                                            @Param("startDate") LocalDate startDate,
                                                                            @Param("endDate") LocalDate endDate,
                                                                            @Param("objectIdParam") Integer objectIdParam);

}

