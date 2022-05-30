package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ObjectDto;
import com.kiteiru.construction.org.dto.queries.ObjectListDTO;
import com.kiteiru.construction.org.dto.queries.ObjectWorkTypeListDTO;
import com.kiteiru.construction.org.dto.queries.ReportListDTO;
import com.kiteiru.construction.org.dto.queries.ScheduleAndEstimateListDTO;
import com.kiteiru.construction.org.services.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import com.kiteiru.construction.org.entities.Object;
import org.springframework.web.bind.annotation.*;


import java.time.LocalDate;
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
    public List<ObjectDto> getAll() {
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
                                                              @RequestParam(required = false) LocalDate startDate,
                                                              @RequestParam(required = false) LocalDate endDate,
                                                              @RequestParam(required = false) Integer workTypeIdParam) {
        return serv.getObjectWorkTypeList(organisationIdParam,
                                            startDate,
                                            endDate,
                                            workTypeIdParam);
    }

    @PostMapping
    public Object save(@RequestBody Object object) {
        return serv.save(object);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
