package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ObjectListDTO;
import com.kiteiru.construction.org.dto.ObjectWorkTypeListDTO;
import com.kiteiru.construction.org.dto.ReportListDTO;
import com.kiteiru.construction.org.dto.ScheduleAndEstimateListDTO;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.repositories.ObjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class ObjectService {
    private final ObjectRepository repo;

    @Autowired
    public ObjectService(ObjectRepository repo) {
        this.repo = repo;
    }
    public List<Object> getAll() {
        return repo.findAll();
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
