package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.WorkTypeOverDeadlineListDTO;
import com.kiteiru.construction.org.entities.WorkType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkTypeRepository extends JpaRepository<WorkType, Integer> {
    @Query(value="SELECT org.name AS organisationName," +
            "               m.name AS managementName," +
            "               s.name AS siteName," +
            "               o.name AS objectName," +
            "               wT.name AS workTypeName," +
            "               sch.deadline AS scheduleDeadline," +
            "               sch.actualDate AS scheduleActualDate" +
            "        FROM Organisation AS org" +
            "                 INNER JOIN Management AS m ON m.organisation = org.id" +
            "                 INNER JOIN Site AS s ON s.management = m.id" +
            "                 INNER JOIN Object AS o ON o.site = s.id" +
            "                 INNER JOIN Schedule AS sch ON sch.object = o.id" +
            "                 INNER JOIN WorkType AS wT ON sch.workType = wT.id" +
            "        WHERE ((:siteIdParam IS NOT NULL AND s.id = :siteIdParam OR :siteIdParam IS NULL)" +
            "          AND (:managementIdParam IS NOT NULL AND m.id = :managementIdParam OR :managementIdParam IS NULL)" +
            "          AND (:organisationIdParam IS NOT NULL AND org.id = :organisationIdParam OR :organisationIdParam IS NULL)" +
            "          AND sch.deadline < sch.actualDate)")
    List<WorkTypeOverDeadlineListDTO> getWorkTypeOverDeadlineList(@Param("siteIdParam") Integer siteIdParam,
                                                                  @Param("managementIdParam") Integer managementIdParam,
                                                                  @Param("organisationIdParam") Integer organisationIdParam);
}
