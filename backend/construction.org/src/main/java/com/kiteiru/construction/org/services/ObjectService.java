package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.queries.ObjectListDTO;
import com.kiteiru.construction.org.dto.queries.ObjectWorkTypeListDTO;
import com.kiteiru.construction.org.dto.queries.ReportListDTO;
import com.kiteiru.construction.org.dto.queries.ScheduleAndEstimateListDTO;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.Site;
import com.kiteiru.construction.org.mapper.ObjectMapper;
import com.kiteiru.construction.org.repositories.ObjectRepository;
import com.kiteiru.construction.org.repositories.SiteRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class ObjectService {
    private final ObjectRepository repo;
    private final SiteRepository siteRepo;

    private final ObjectMapper objectMapper;

    public ObjectService(ObjectRepository repo, SiteRepository siteRepo, ObjectMapper objectMapper) {
        this.repo = repo;
        this.siteRepo = siteRepo;
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

    public Object save(Object object) {
        return repo.save(object);
    }

    /*@Transactional
    public Object update(Object object) {
        Object objToUpd = repo.findById(object.getId()).orElseThrow(() -> new IllegalStateException("no person with id " + object.getId()));
        if (object.getName() != null) {
            objToUpd.setName(object.getName());
        }
        if (object.getSite().getId() != null) {
            Integer siteId = object.getSite().getId();
            Site site = siteRepo.getById(siteId);
            objToUpd.setSite(site);
        }
        return repo.save(object);
    }*/

    public void delete(Integer id) {
        repo.deleteById(id);
    }
}

