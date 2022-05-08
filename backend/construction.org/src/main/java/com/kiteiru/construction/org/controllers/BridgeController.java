package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.entities.Bridge;
import com.kiteiru.construction.org.services.BridgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/bridge")
public class BridgeController {
    private final BridgeService serv;

    @Autowired
    public BridgeController(BridgeService serv) {
        this.serv = serv;
    }

    @GetMapping
    public List<Bridge> getAll() {
        return serv.getAll();
    }
}
