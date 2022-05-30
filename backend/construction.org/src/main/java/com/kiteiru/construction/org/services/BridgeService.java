package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.BridgeDto;
import com.kiteiru.construction.org.entities.Bridge;
import com.kiteiru.construction.org.mapper.BridgeMapper;
import com.kiteiru.construction.org.repositories.BridgeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BridgeService {
    private final BridgeRepository repo;

    private final BridgeMapper bridgeMapper;

    @Autowired
    public BridgeService(BridgeRepository repo, BridgeMapper bridgeMapper) {
        this.repo = repo;
        this.bridgeMapper = bridgeMapper;
    }
    public List<BridgeDto> getAll() {
        List<Bridge> bridges =  new ArrayList<>(repo.findAll());
        return bridgeMapper.entitiesToDtos(bridges);
    }

    public Bridge save(Bridge bridge) {
        return repo.save(bridge);
    }
    public void delete(Integer id) {
        repo.deleteBridgeByObjectId(id);
    }
}
