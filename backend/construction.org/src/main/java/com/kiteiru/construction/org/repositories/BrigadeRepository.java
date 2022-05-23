package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.queries.BrigadeListDTO;
import com.kiteiru.construction.org.dto.queries.BrigadeByWorkTypeInPeriodListDTO;
import com.kiteiru.construction.org.entities.Brigade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface BrigadeRepository extends JpaRepository<Brigade, Integer> {
    /*@Query(value = "SELECT o.name AS objectName," +
            "               b.id AS brigadeId," +
            "               w.surname AS workerSurname," +
            "               w.name AS workerName," +
            "               w.patronymic AS workerPatronymic," +
            "               l.labourType AS labourType" +
            "        FROM Object AS o" +
            "                 INNER JOIN WorkTypeByBrigade AS wTbB ON o.id = wTbB.objectId" +
            "                 INNER JOIN Brigade AS b on wTbB.brigadeId = b.id" +
            "                 INNER JOIN Labour l on b.id = l.brigadeId" +
            "                 INNER JOIN Worker w on l.id = w.id" +
            "        WHERE (:objectIdParam IS NOT NULL AND o.id = :objectIdParam OR :objectIdParam IS NULL)")
    List<BrigadeListDTO> getBrigadeList(@Param("objectIdParam") Integer objectIdParam);

    @Query(value = "SELECT o.name AS objectName," +
            "               b.id AS brigadeId," +
            "               wT.name AS workTypeName," +
            "               sch.actualDate AS scheduleActualDate" +
            "        FROM WorkTypeByBrigade AS wTbB" +
            "                 INNER JOIN Object AS o ON wTbB.objectId = o.id" +
            "                 INNER JOIN Schedule AS sch ON wTbB.objectId = sch.object AND wTbB.workTypeId = sch.workType" +
            "                 INNER JOIN Brigade AS b ON wTbB.brigadeId = b.id" +
            "                 INNER JOIN WorkType AS wT ON wT.id = sch.workType" +
            "        WHERE ((:workTypeIdParam IS NOT NULL AND wT.id = :workTypeIdParam OR :workTypeIdParam IS NULL)" +
            "          AND ((:startDate IS NOT NULL AND :endDate IS NOT NULL AND sch.actualDate BETWEEN :startDate AND :endDate AND :startDate <= :endDate)" +
            "            OR (:startDate IS NOT NULL AND :endDate IS NULL AND sch.actualDate >= :startDate)" +
            "            OR (:startDate IS NULL AND :endDate IS NOT NULL AND sch.actualDate <= :endDate)" +
            "            OR (:startDate IS NULL AND :endDate IS NULL))" +
            "          AND (:objectIdParam IS NOT NULL AND o.id = :objectIdParam OR :objectIdParam IS NULL))" +
            "        ORDER BY o.name")
    List<BrigadeByWorkTypeInPeriodListDTO> getBrigadeByWorkTypeInPeriodList(@Param("workTypeIdParam") Integer workTypeIdParam,
                                                                           @Param("startDate") Date startDate,
                                                                           @Param("endDate") Date endDate,
                                                                           @Param("objectIdParam") Integer objectIdParam);
*/
}

