package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO;
import com.kiteiru.construction.org.dto.EngineerTechStaffListDTO2;
import com.kiteiru.construction.org.entities.EngineerTechStaff;
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
    public List<EngineerTechStaff> getAll() {
        return serv.getAll();
    }

    @GetMapping(path = "/get")
    public List <EngineerTechStaffListDTO2> GetEngineerTechWorkers(@RequestParam(required = false, defaultValue = "4") Integer site_id_param) {
        return serv.GetEngineerTechWorkers(site_id_param);
    }
}
