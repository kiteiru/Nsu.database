package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.WorkTypeByBrigadeDto;
import com.kiteiru.construction.org.dto.queries.WorkTypeByBrigadeInPeriodListDTO;
import com.kiteiru.construction.org.entities.WorkTypeByBrigade;
import com.kiteiru.construction.org.services.WorkTypeByBrigadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.time.LocalDate;
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
    public List<WorkTypeByBrigadeDto> getAll() {
        return serv.getAll();
    }


    @GetMapping(path = "/in_period")
    public List<WorkTypeByBrigadeInPeriodListDTO> getWorkTypeByBrigadeInPeriodList(@RequestParam(required = false) Integer brigadeIdParam,
                                                                                   @RequestParam(required = false) LocalDate startDate,
                                                                                   @RequestParam(required = false) LocalDate endDate,
                                                                                   @RequestParam(required = false) Integer objectIdParam) {
        return serv.getWorkTypeByBrigadeInPeriodList(brigadeIdParam,
                                                     startDate,
                                                     endDate,
                                                     objectIdParam);
    }

    @PostMapping
    public WorkTypeByBrigade save(@RequestBody WorkTypeByBrigade workTypeByBrigade) {
        return serv.save(workTypeByBrigade);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
