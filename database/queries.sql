--  1. Получить перечень строительных управлений и/или участков и их руководителей.

SELECT *
FROM GetManagementList();

DROP FUNCTION GetManagementList;
CREATE OR REPLACE FUNCTION GetManagementList()
    RETURNS TABLE
            (
                managementName VARCHAR,
                siteName       VARCHAR,
                surname        VARCHAR,
                name           VARCHAR,
                patronymic     VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT m.name,
               s.name,
               w.surname,
               w.name,
               w.patronymic
        FROM management AS m
                 INNER JOIN site AS s ON m.id = s."managementId"
                 INNER JOIN worker AS w ON s."headId" = w.id;
END;
$$ LANGUAGE plpgsql;

--  2. Получить список специалистов инженерно-технического состава обозначенного участка или строительного управления с указанием их должностей.

SELECT *
FROM GetEngineerTechWorkers('{Apartment Complex \"Nature\"}',
                            '{Novosibirsk City Buildings Management, Eurika Management}');

DROP FUNCTION GetEngineerTechWorkers;
CREATE OR REPLACE FUNCTION GetEngineerTechWorkers(
    siteList VARCHAR[],
    managementList VARCHAR[]
)
    RETURNS TABLE
            (
                managementName             VARCHAR,
                siteName                   VARCHAR,
                workerSurname              VARCHAR,
                workerName                 VARCHAR,
                workerPatronymic           VARCHAR,
                engineerTechnicalStaffType engineerTechnicalStaffType
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT m.name,
               s.name,
               w.surname,
               w.name,
               w.patronymic,
               e."engineerTechnicalStaffType"
        FROM management AS m
                 INNER JOIN site AS s ON m.id = s."managementId"
                 INNER JOIN "engineerTechnicalStaff" AS e ON s."headId" = e."headId" OR s."headId" = e.id
                 INNER JOIN worker AS w ON e.id = w.id
        WHERE ((cardinality(siteList) != 0 AND s.name = ANY (siteList)) OR cardinality(siteList) = 0)
          AND ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0);
END;
$$ LANGUAGE plpgsql;

--  3. Получить перечень объектов, возводимых указанным строительным управлением и/или участком, и графики их возведения.

SELECT *
FROM GetObjectList('{}', '{}');

DROP FUNCTION GetObjectList;
CREATE OR REPLACE FUNCTION GetObjectList(
    managementList VARCHAR[],
    siteList VARCHAR[]
)
    RETURNS TABLE
            (
                managementName VARCHAR,
                siteName       VARCHAR,
                objectName     VARCHAR,
                deadline       DATE,
                workTypeName   VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT m.name,
               s.name,
               o.name,
               sch.deadline,
               wT.name
        FROM management AS m
                 INNER JOIN site AS s ON m.id = s."managementId"
                 INNER JOIN object AS o ON s.id = o."siteId"
                 INNER JOIN schedule AS sch ON o.id = sch."objectId"
                 INNER JOIN "workType" wT on sch."workTypeId" = wT.id
        WHERE ((cardinality(siteList) != 0 AND s.name = ANY (siteList)) OR cardinality(siteList) = 0)
          AND ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0);
END;
$$ LANGUAGE plpgsql;

--  4. Получить состав бригад, работавших (работающих) на строительстве указанного объекта.

SELECT *
FROM GetBrigadeWorkerList('{}');

DROP FUNCTION GetBrigadeWorkerList;
CREATE OR REPLACE FUNCTION GetBrigadeWorkerList(
    objectList VARCHAR[]
)
    RETURNS TABLE
            (
                objectName VARCHAR,
                brigadeId  INTEGER,
                surname    VARCHAR,
                name       VARCHAR,
                patronymic VARCHAR,
                labourType labourtype
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT o.name,
               b.id,
               w.surname,
               w.name,
               w.patronymic,
               l."labourType"
        FROM object AS o
                 INNER JOIN "workTypeByBrigade" AS wTbB ON o.id = wTbB."objectId"
                 INNER JOIN brigade AS b on wTbB."brigadeId" = b.id
                 INNER JOIN labour l on b."brigadierId" = l.id
                INNER JOIN labour l2 on l2."brigadierId" = l.id
                 INNER JOIN worker w on l.id = w.id
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0);
END;
$$ LANGUAGE plpgsql;

--  5. Получить перечень строительной техники, приданной указанному строительному управлению.

SELECT *
FROM GetEquipmentPerManagementList('{Novosibirsk City Buildings Management}');

DROP FUNCTION GetEquipmentPerManagementList;
CREATE OR REPLACE FUNCTION GetEquipmentPerManagementList(
    managementList VARCHAR[]
)
    RETURNS TABLE
            (
                equipmentType  VARCHAR,
                equipmentNum   INTEGER,
                objectName     VARCHAR,
                managementName VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT e.type,
               e.number,
               o.name,
               m.name
        FROM management AS m
                 INNER JOIN site AS s ON s."managementId" = m.id
                 INNER JOIN object AS o ON o."siteId" = s.id
                 INNER JOIN equipment AS e ON e."objectId" = o.id
        WHERE ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0);
END;
$$ LANGUAGE plpgsql;

--  6. Получить перечень строительной техники, выделенной на указанный объект либо работавшей там в течение указанного периода времени.

CREATE OR REPLACE FUNCTION GetStartDate(anyarray)
    RETURNS anyelement
    LANGUAGE SQL
AS
$$
SELECT min(elements)
FROM unnest($1) elements
$$;

CREATE OR REPLACE FUNCTION GetEndDate(anyarray)
    RETURNS anyelement
    LANGUAGE SQL
AS
$$
SELECT max(elements)
FROM unnest($1) elements
$$;

SELECT *
FROM GetEquipmentPerObjectList('{}', '{2010-04-01, 2001-02-07}');

DROP FUNCTION GetEquipmentPerObjectList;
CREATE OR REPLACE FUNCTION GetEquipmentPerObjectList(
    objectList VARCHAR[],
    dateList DATE[]
)
    RETURNS TABLE
            (
                equipmentType VARCHAR,
                equipmentNum  INTEGER,
                objectName    VARCHAR,
                actualDate    DATE
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT e.type,
               e.number,
               o.name,
               sch."actualDate"
        FROM management AS m
                 INNER JOIN site AS s ON s."managementId" = m.id
                 INNER JOIN object AS o ON o."siteId" = s.id
                 INNER JOIN equipment AS e ON e."objectId" = o.id
                 INNER JOIN schedule AS sch ON o.id = sch."objectId"
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
          AND ((cardinality(dateList) != 0 AND sch."actualDate" BETWEEN GetStartDate(dateList) AND GetEndDate(dateList))
            OR cardinality(dateList) = 0);
END;
$$ LANGUAGE plpgsql;

--  7. Получить график и смету на строительство указанного объекта.

SELECT *
FROM GetScheduleAndEstimatePerObject('{College Main Building}');

DROP FUNCTION GetScheduleAndEstimatePerObject;
CREATE OR REPLACE FUNCTION GetScheduleAndEstimatePerObject(
    objectList VARCHAR[]
)
    RETURNS TABLE
            (
                objectName         VARCHAR,
                deadline           DATE,
                workType           VARCHAR,
                materialNameAndNum TEXT
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT o.name,
               sch.deadline,
               wT.name,
               string_agg(concat_ws(': ', m.name, e."materialNum"), ', ')
        FROM object AS o
                 INNER JOIN schedule AS sch ON sch."objectId" = o.id
                 INNER JOIN "workType" AS wT ON sch."workTypeId" = wT.id
                 INNER JOIN estimate AS e ON o.id = e."objectId"
                 INNER JOIN material AS m ON e."materialId" = m.id
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
        GROUP BY o.name, sch.deadline, wT.name
        ORDER BY o.name;
END;
$$ LANGUAGE plpgsql;

--  8. Получить отчет о сооружении указанного объекта.

SELECT *
FROM GetReportPerObject('{}');

DROP FUNCTION GetReportPerObject;
CREATE OR REPLACE FUNCTION GetReportPerObject(
    objectList VARCHAR[]
)
    RETURNS TABLE
            (
                objectName                VARCHAR,
                workTypeName              VARCHAR,
                actualDate                DATE,
                materialAndActualExpenses TEXT
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT o.name,
               wT.name,
               sch."actualDate",
               string_agg(concat_ws(': ', m.name, e."actualExpenses"), ', ')
        FROM object AS o
                 INNER JOIN schedule AS sch ON sch."objectId" = o.id
                 INNER JOIN "workType" AS wT ON sch."workTypeId" = wT.id
                 INNER JOIN estimate AS e ON e."objectId" = o.id
                 INNER JOIN material AS m ON m.id = e."materialId"
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
        GROUP BY o.name, wT.name, sch."actualDate"
        ORDER BY o.name;
END;
$$ LANGUAGE plpgsql;

--  9. Получить перечень объектов, возводимых в некотором строительном управлении или в целом по организации, на которых в обозначенный период времени выполнялся указанный вид строительных работ.

SELECT *
FROM GetObjectsWorkTypeInPeriod('{}', '{}', '{}', '{}');

DROP FUNCTION GetObjectsWorkTypeInPeriod;
CREATE OR REPLACE FUNCTION GetObjectsWorkTypeInPeriod(
    managementList VARCHAR[],
    organisationList VARCHAR[],
    dateList DATE[],
    workTypeList VARCHAR[]
)
    RETURNS TABLE
            (
                organisationName VARCHAR,
                managementName   VARCHAR,
                objectName       VARCHAR,
                workType         VARCHAR,
                actualDate       DATE
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT org.name,
               m.name,
               o.name,
               wT.name,
               sch."actualDate"
        FROM organisation AS org
                 INNER JOIN management AS m ON m."organisationId" = org.id
                 INNER JOIN site AS s ON s."managementId" = m.id
                 INNER JOIN object AS o ON o."siteId" = s.id
                 INNER JOIN schedule AS sch ON o.id = sch."objectId"
                 INNER JOIN "workType" AS wT ON sch."workTypeId" = wT.id
        WHERE ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0)
          AND ((cardinality(organisationList) != 0 AND org.name = ANY (organisationList)) OR
               cardinality(organisationList) = 0)
          AND ((cardinality(dateList) != 0 AND
                sch."actualDate" BETWEEN GetStartDate(dateList) AND GetEndDate(dateList)) OR cardinality(dateList) = 0)
          AND ((cardinality(workTypeList) != 0 AND wT.name = ANY (workTypeList)) OR cardinality(workTypeList) = 0);
END;
$$ LANGUAGE plpgsql;

-- 10. Получить перечень видов строительных работ, по которым имело место превышение сроков выполнения на указанном участке, строительном управлении или в целом по организации.

SELECT *
FROM GetWorkTypeOverDeadline('{}', '{}', '{}');

DROP FUNCTION GetWorkTypeOverDeadline;
CREATE OR REPLACE FUNCTION GetWorkTypeOverDeadline(
    siteList VARCHAR[],
    managementList VARCHAR[],
    organisationList VARCHAR[]
)
    RETURNS TABLE
            (
                organisationName VARCHAR,
                managementName   VARCHAR,
                siteName         VARCHAR,
                objectName       VARCHAR,
                workTypeName     VARCHAR,
                deadline         DATE,
                actualDate       DATE
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT org.name,
               m.name,
               s.name,
               o.name,
               wT.name,
               sch.deadline,
               sch."actualDate"
        FROM organisation AS org
                 INNER JOIN management AS m ON m."organisationId" = org.id
                 INNER JOIN site AS s ON s."managementId" = m.id
                 INNER JOIN object AS o ON o."siteId" = s.id
                 INNER JOIN schedule AS sch ON sch."objectId" = o.id
                 INNER JOIN "workType" AS wT ON sch."workTypeId" = wT.id
        WHERE ((cardinality(siteList) != 0 AND s.name = ANY (siteList)) OR cardinality(siteList) = 0)
          AND ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0)
          AND ((cardinality(organisationList) != 0 AND org.name = ANY (organisationList)) OR
               cardinality(organisationList) = 0)
          AND sch.deadline < sch."actualDate";
END;
$$ LANGUAGE plpgsql;

-- 11. Получить перечень строительных материалов, по которым имело место превышение по смете на указанном участке, строительном управлении или в целом по организации.

SELECT *
FROM GetMaterialOverPlannedExpenses('{Apartment Complex \"Nature\"}', '{}', '{}');

DROP FUNCTION GetMaterialOverPlannedExpenses;
CREATE OR REPLACE FUNCTION GetMaterialOverPlannedExpenses(
    siteList VARCHAR[],
    managementList VARCHAR[],
    organisationList VARCHAR[]
)
    RETURNS TABLE
            (
                organisationName VARCHAR,
                managementName   VARCHAR,
                siteName         VARCHAR,
                objectName       VARCHAR,
                materialName     VARCHAR,
                plannedExpenses  FLOAT,
                actualExpenses   FLOAT
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT org.name,
               m.name,
               s.name,
               o.name,
               mat.name,
               (e."materialNum" * mat.price) AS plannedExpenses,
               e."actualExpenses"
        FROM organisation AS org
                 INNER JOIN management AS m ON m."organisationId" = org.id
                 INNER JOIN site AS s ON s."managementId" = m.id
                 INNER JOIN object AS o ON o."siteId" = s.id
                 INNER JOIN estimate AS e ON e."objectId" = o.id
                 INNER JOIN material AS mat ON mat.id = e."materialId"
        WHERE ((cardinality(siteList) != 0 AND s.name = ANY (siteList)) OR cardinality(siteList) = 0)
          AND ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0)
          AND ((cardinality(organisationList) != 0 AND org.name = ANY (organisationList)) OR
               cardinality(organisationList) = 0)
          AND (e."materialNum" * mat.price) < e."actualExpenses";
END;
$$ LANGUAGE plpgsql;

-- 12. Получить перечень видов строительных работ, выполненных указанной бригадой в течение обозначенного периода времени с указанием объектов, где эти работы выполнялись.

SELECT * FROM GetWorkTypeByBrigade('{}', '{}', '{}');

DROP FUNCTION GetWorkTypeByBrigade;
CREATE OR REPLACE FUNCTION GetWorkTypeByBrigade(
    brigadeList INTEGER[],
    dateList DATE[],
    objectList VARCHAR[]
                                      )
RETURNS TABLE(
    objectName VARCHAR,
    brigadeId INTEGER,
    workType VARCHAR,
    actualDate DATE
)
    AS
    $$
    BEGIN
        RETURN QUERY
        SELECT o.name,
               b.id,
               wT.name,
               sch."actualDate"
            FROM "workTypeByBrigade" AS wTbB
                INNER JOIN object AS o ON wTbB."objectId" = o.id
                INNER JOIN schedule AS sch ON wTbB."objectId" = sch."objectId" AND wTbB."workTypeId" = sch."workTypeId"
                INNER JOIN brigade AS b ON wTbB."brigadeId" = b.id
                INNER JOIN "workType" AS wT ON wT.id = sch."workTypeId"
        WHERE ((cardinality(brigadeList) != 0 AND b.id = ANY (brigadeList)) OR cardinality(brigadeList) = 0)
        AND ((cardinality(dateList) != 0 AND sch."actualDate" BETWEEN GetStartDate(dateList) AND GetEndDate(dateList)) OR cardinality(dateList) = 0)
        AND ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
        ORDER BY o.name;
    END;
    $$ LANGUAGE plpgsql;

-- 13. Получить перечень бригад, которые выполнили указанный вид строительных работ в течение обозначенного периода времени с указанием объектов, где эти работы выполнялись.

SELECT * FROM GetBrigadeByWorkType('{Water supply laying, Digging}', '{}', '{}');

DROP FUNCTION GetBrigadeByWorkType;
CREATE OR REPLACE FUNCTION GetBrigadeByWorkType(
    workTypeList VARCHAR[],
    dateList DATE[],
    objectList VARCHAR[]
)
    RETURNS TABLE(
                     objectName VARCHAR,
                     brigadeId INTEGER,
                     workType VARCHAR,
                     actualDate DATE
                 )
AS
$$
BEGIN
    RETURN QUERY
        SELECT o.name,
               b.id,
               wT.name,
               sch."actualDate"
        FROM "workTypeByBrigade" AS wTbB
                 INNER JOIN object AS o ON wTbB."objectId" = o.id
                 INNER JOIN schedule AS sch ON wTbB."objectId" = sch."objectId" AND wTbB."workTypeId" = sch."workTypeId"
                 INNER JOIN brigade AS b ON wTbB."brigadeId" = b.id
                 INNER JOIN "workType" AS wT ON wT.id = sch."workTypeId"
        WHERE ((cardinality(workTypeList) != 0 AND wT.name = ANY (workTypeList)) OR cardinality(workTypeList) = 0)
          AND ((cardinality(dateList) != 0 AND sch."actualDate" BETWEEN GetStartDate(dateList) AND GetEndDate(dateList)) OR cardinality(dateList) = 0)
          AND ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
        ORDER BY o.name;
END;
$$ LANGUAGE plpgsql;