package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.EngineerTechStaffDto;
import com.kiteiru.construction.org.dto.queries.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.services.EngineerTechStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/engineer_tech_staff")
public class EngineerTechStaffController {
    private final EngineerTechStaffService serv;

    @Autowired
    public EngineerTechStaffController(EngineerTechStaffService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<EngineerTechStaffDto> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/list")
    public List<EngineerTechStaffListDTO> getEngineerTechStaffList(@RequestParam(required = false) Integer siteIdParam) {
        return serv.getEngineerTechStaffList(siteIdParam);
    }
}
