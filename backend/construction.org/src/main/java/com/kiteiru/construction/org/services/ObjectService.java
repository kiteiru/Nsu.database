package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.queries.ObjectListDTO;
import com.kiteiru.construction.org.dto.queries.ObjectWorkTypeListDTO;
import com.kiteiru.construction.org.dto.queries.ReportListDTO;
import com.kiteiru.construction.org.dto.queries.ScheduleAndEstimateListDTO;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.mapper.ObjectMapper;
import com.kiteiru.construction.org.repositories.ObjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class ObjectService {
    private final ObjectRepository repo;

    private final ObjectMapper objectMapper;

    public ObjectService(ObjectRepository repo, ObjectMapper objectMapper) {
        this.repo = repo;
        this.objectMapper = objectMapper;
    }
    public List<ObjectDto> getAll() {
        List<Object> objects =  new ArrayList<>(repo.findAll());
        return objectMapper.entitiesToDtos(objects);
    }

    public List<ObjectListDTO> getObjectList(Integer siteIdParam) {
        return repo.getObjectList(siteIdParam);
    }

    public List<ObjectWorkTypeListDTO> getObjectWorkTypeList(Integer organisationIdParam,
                                                               Date startDate,
                                                               Date endDate,
                                                               Integer workTypeIdParam) {
        return repo.getObjectWorkTypeList(organisationIdParam,
                                            startDate,
                                            endDate,
                                            workTypeIdParam);
    }

    public List<ScheduleAndEstimateListDTO> getScheduleAndEstimateList(Integer objectIdParam) {
        return repo.getScheduleAndEstimateList(objectIdParam);
    }

    public List<ReportListDTO> getReportList(Integer objectIdParam) {
        return repo.getReportList(objectIdParam);
    }
}
