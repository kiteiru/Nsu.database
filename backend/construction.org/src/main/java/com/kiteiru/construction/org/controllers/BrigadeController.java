package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.BrigadeDto;
import com.kiteiru.construction.org.dto.queries.BrigadeByWorkTypeInPeriodListDTO;
import com.kiteiru.construction.org.dto.queries.BrigadeListDTO;
import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.services.BrigadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping(path = "api/v1/brigade")
public class BrigadeController {
    private final BrigadeService serv;

    @Autowired
    public BrigadeController(BrigadeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<BrigadeDto> getAll() {
        return serv.getAll();
    }


    @GetMapping(path = "/list")
    public List <BrigadeListDTO> getBrigadeList(@RequestParam(required = false) Integer objectIdParam) {
        return serv.getBrigadeList(objectIdParam);
    }

    @GetMapping(path = "/in_period")
    public List <BrigadeByWorkTypeInPeriodListDTO> getBrigadeByWorkTypeInPeriodList(@RequestParam(required = false) Integer workTypeIdParam,
                                                                                    @RequestParam(required = false) LocalDate startDate,
                                                                                    @RequestParam(required = false) LocalDate endDate,
                                                                                    @RequestParam(required = false) Integer objectIdParam) {
        return serv.getBrigadeByWorkTypeInPeriodList(workTypeIdParam,
                                                    startDate,
                                                    endDate,
                                                    objectIdParam);
    }



    @PostMapping
    public Brigade save(@RequestBody Brigade brigade) {
        return serv.save(brigade);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
