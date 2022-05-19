package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.BrigadeListDTO;
import com.kiteiru.construction.org.dto.BrigadeByWorkTypeInPeriodListDTO;
import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.services.BrigadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
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
    public List<Brigade> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/list")
    public List <BrigadeListDTO> getBrigadeList(@RequestParam(required = false) Integer objectIdParam) {
        return serv.getBrigadeList(objectIdParam);
    }

    @GetMapping(path = "/in_period")
    public List <BrigadeByWorkTypeInPeriodListDTO> getBrigadeByWorkTypeInPeriodList(@RequestParam(required = false) Integer workTypeIdParam,
                                                                                   @RequestParam(required = false) Date startDate,
                                                                                   @RequestParam(required = false) Date endDate,
                                                                                   @RequestParam(required = false) Integer objectIdParam) {
        return serv.getBrigadeByWorkTypeInPeriodList(workTypeIdParam,
                                                    startDate,
                                                    endDate,
                                                    objectIdParam);
    }
}
