package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.ManagementInfoDTO;
import com.kiteiru.construction.org.entities.Management;
import com.kiteiru.construction.org.services.ManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/management")
public class ManagementController {
    private final ManagementService serv;

    @Autowired
    public ManagementController(ManagementService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Management> getAll() {
        return serv.getAll();
    }

    //@GetMapping(path = "/get_management_list")
    //public List<ManagementInfoDTO> GetManagementList() {
    //    return serv.GetManagementList();
    //}
}
