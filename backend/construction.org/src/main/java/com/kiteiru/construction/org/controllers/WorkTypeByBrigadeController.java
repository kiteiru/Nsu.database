package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.WorkTypeByBrigadeInPeriodListDTO;
import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import com.kiteiru.construction.org.services.WorkTypeByBrigadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping(path = "api/v1/work_type_by_brigade")
public class WorkTypeByBrigadeController {
    private final WorkTypeByBrigadeService serv;

    @Autowired
    public WorkTypeByBrigadeController(WorkTypeByBrigadeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<WorkTypeByBrigade> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/in_period")
    public List<WorkTypeByBrigadeInPeriodListDTO> getWorkTypeByBrigadeInPeriodList(@RequestParam(required = false) Integer brigadeIdParam,
                                                                                   @RequestParam(required = false) Date startDate,
                                                                                   @RequestParam(required = false) Date endDate,
                                                                                   @RequestParam(required = false) Integer objectIdParam) {
        return serv.getWorkTypeByBrigadeInPeriodList(brigadeIdParam,
                                                     startDate,
                                                     endDate,
                                                     objectIdParam);
    }
}
