package com.kiteiru.construction.org.controllers;

import com.kiteiru.construction.org.dto.BridgeDto;
import com.kiteiru.construction.org.entities.Bridge;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.services.BridgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    public List<BridgeDto> getAll() {
        return serv.getAll();
    }

    @PostMapping
    public Bridge save(@RequestBody Bridge bridge) {
        return serv.save(bridge);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id) {
        serv.delete(id);
    }
}
