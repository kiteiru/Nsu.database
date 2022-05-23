package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.queries.ObjectListDTO;
import com.kiteiru.construction.org.dto.queries.ObjectWorkTypeListDTO;
import com.kiteiru.construction.org.dto.queries.ReportListDTO;
import com.kiteiru.construction.org.dto.queries.ScheduleAndEstimateListDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.kiteiru.construction.org.entities.Object;
import java.sql.Date;
import java.util.List;

@Repository
public interface ObjectRepository extends JpaRepository<Object, Integer> {
    @Query(value="SELECT m.name AS managementName," +
            "               s.name AS siteName," +
            "               o.name AS objectName," +
            "               sch.deadline AS scheduleDeadline," +
            "               wT.name AS workTypeName" +
            "        FROM Management AS m" +
            "                 INNER JOIN Site AS s ON m.id = s.management.id" +
            "                 INNER JOIN Object AS o ON s.id = o.site.id" +
            "                 INNER JOIN Schedule AS sch ON o.id = sch.object" +
            "                 INNER JOIN WorkType wT on sch.workType = wT.id" +
            "        WHERE (:siteIdParam IS NOT NULL AND s.id = :siteIdParam OR :siteIdParam IS NULL)")
    List<ObjectListDTO> getObjectList(@Param("siteIdParam") Integer siteIdParam);

    @Query(value="SELECT org.name AS organisationName," +
            "               m.name AS managementName," +
            "               o.name AS objectName," +
            "               wT.name AS workTypeName," +
            "               sch.actualDate AS scheduleActualDate" +
            "        FROM Organisation AS org" +
            "                 INNER JOIN Management AS m ON m.organisation = org.id" +
            "                 INNER JOIN Site AS s ON s.management = m.id" +
            "                 INNER JOIN Object AS o ON o.site = s.id" +
            "                 INNER JOIN Schedule AS sch ON o.id = sch.object" +
            "                 INNER JOIN WorkType AS wT ON sch.workType = wT.id" +
            "        WHERE ((:organisationIdParam IS NOT NULL AND org.id = :organisationIdParam OR :organisationIdParam IS NULL)" +
            "          AND ((:startDate IS NOT NULL AND :endDate IS NOT NULL AND sch.actualDate BETWEEN :startDate AND :endDate AND :startDate <= :endDate)" +
            "            OR (:startDate IS NOT NULL AND :endDate IS NULL AND sch.actualDate >= :startDate)" +
            "            OR (:startDate IS NULL AND :endDate IS NOT NULL AND sch.actualDate <= :endDate)" +
            "            OR (:startDate IS NULL AND :endDate IS NULL))" +
            "        AND (:workTypeIdParam IS NOT NULL AND wT.id = :workTypeIdParam OR :workTypeIdParam IS NULL))")
    List<ObjectWorkTypeListDTO> getObjectWorkTypeList(@Param("organisationIdParam") Integer organisationIdParam,
                                                        @Param("startDate") Date startDate,
                                                        @Param("endDate") Date endDate,
                                                        @Param("workTypeIdParam") Integer workTypeIdParam);

    @Query(value="SELECT o.name AS objectName," +
            "               sch.deadline AS scheduleDeadline," +
            "               wT.name AS workTypeName," +
            "               CONCAT(m.name, ': ', e.expenses) AS materialAndEstimate" +
            "        FROM Object AS o" +
            "                 INNER JOIN Schedule AS sch ON sch.object = o.id" +
            "                 INNER JOIN WorkType AS wT ON sch.workType = wT.id" +
            "                 INNER JOIN Estimate AS e ON e.object = o.id" +
            "                 INNER JOIN Material AS m ON m.id = e.material" +
            "        WHERE (:objectIdParam IS NOT NULL AND o.id = :objectIdParam OR :objectIdParam IS NULL)" +
            "        ORDER BY o.name")
    List<ScheduleAndEstimateListDTO> getScheduleAndEstimateList(@Param("objectIdParam") Integer objectIdParam);

    @Query(value="SELECT o.name AS objectName," +
            "               wT.name AS workTypeName," +
            "               sch.actualDate AS scheduleActualDate," +
            "               e.expenses AS estimateExpenses" +
            "        FROM Object AS o" +
            "                 INNER JOIN Schedule AS sch ON sch.object = o.id" +
            "                 INNER JOIN WorkType AS wT ON sch.workType = wT.id" +
            "                 INNER JOIN Estimate AS e ON e.object = o.id" +
            "                 INNER JOIN Material AS m ON m.id = e.material" +
            "        WHERE (:objectIdParam IS NOT NULL AND o.id = :objectIdParam OR :objectIdParam IS NULL)" +
            "        ORDER BY o.name")
    List<ReportListDTO> getReportList(@Param("objectIdParam") Integer objectIdParam);
}
