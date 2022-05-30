package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.queries.WorkTypeOverDeadlineListDTO;
import com.kiteiru.construction.org.entities.WorkType;
import com.kiteiru.construction.org.services.WorkTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/work_type")
public class WorkTypeController {
    private final WorkTypeService serv;

    @Autowired
    public WorkTypeController(WorkTypeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<WorkType> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/over_deadline")
    public List<WorkTypeOverDeadlineListDTO> getWorkTypeOverDeadlineList(@RequestParam(required = false) Integer siteIdParam,
                                                                         @RequestParam(required = false) Integer managementIdParam,
                                                                         @RequestParam(required = false) Integer organisationIdParam) {
        return serv.getWorkTypeOverDeadlineList(siteIdParam,
                                                managementIdParam,
                                                organisationIdParam);
    }

    @PostMapping
    public WorkType save(@RequestBody WorkType workType) {
        return serv.save(workType);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
