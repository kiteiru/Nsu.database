package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.queries.MaterialOverEstimateListDTO;
import com.kiteiru.construction.org.entities.Material;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialRepository extends JpaRepository<Material, Integer> {
    @Query(value = "SELECT org.name AS organisationName," +
            "               m.name AS managementName," +
            "               s.name AS siteName," +
            "               o.name AS objectName," +
            "               mat.name AS materialName," +
            "               (e.materialNum * mat.price) AS plannedExpenses," +
            "               e.expenses AS estimateExpenses" +
            "        FROM Organisation AS org" +
            "                 INNER JOIN Management AS m ON m.organisation = org.id" +
            "                 INNER JOIN Site AS s ON s.management = m.id" +
            "                 INNER JOIN Object AS o ON o.site = s.id" +
            "                 INNER JOIN Estimate AS e ON e.object = o.id" +
            "                 INNER JOIN Material AS mat ON mat.id = e.material" +
            "        WHERE ((:siteIdParam IS NOT NULL AND s.id = :siteIdParam OR :siteIdParam IS NULL)" +
            "          AND (:managementIdParam IS NOT NULL AND m.id = :managementIdParam OR :managementIdParam IS NULL)" +
            "          AND (:organisationIdParam IS NOT NULL AND org.id = :organisationIdParam OR :organisationIdParam IS NULL)" +
            "          AND (e.materialNum * mat.price) < e.expenses)")
    List<MaterialOverEstimateListDTO> getMaterialOverEstimateList(@Param("siteIdParam") Integer siteIdParam,
                                                                  @Param("managementIdParam") Integer managementIdParam,
                                                                  @Param("organisationIdParam") Integer organisationIdParam);
}
