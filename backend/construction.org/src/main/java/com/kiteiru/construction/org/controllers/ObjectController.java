package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.*;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.services.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping(path = "api/v1/object")
public class ObjectController {
    private final ObjectService serv;

    @Autowired
    public ObjectController(ObjectService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Object> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/list")
    public List <ObjectListDTO> getObjectList(@RequestParam(required = false) Integer siteIdParam) {
        return serv.getObjectList(siteIdParam);
    }

    @GetMapping(path = "/schedule_and_estimate")
    public List <ScheduleAndEstimateListDTO> getScheduleAndEstimateList(@RequestParam(required = false) Integer objectIdParam) {
        return serv.getScheduleAndEstimateList(objectIdParam);
    }

    @GetMapping(path = "/report")
    public List <ReportListDTO> getReportList(@RequestParam(required = false) Integer objectIdParam) {
        return serv.getReportList(objectIdParam);
    }

    @GetMapping(path = "/work_type")
    public List <ObjectWorkTypeListDTO> getObjectWorkTypeList(@RequestParam(required = false) Integer organisationIdParam,
                                                                @RequestParam(required = false) Date startDate,
                                                                @RequestParam(required = false) Date endDate,
                                                                @RequestParam(required = false) Integer workTypeIdParam) {
        return serv.getObjectWorkTypeList(organisationIdParam,
                                            startDate,
                                            endDate,
                                            workTypeIdParam);
    }
}
