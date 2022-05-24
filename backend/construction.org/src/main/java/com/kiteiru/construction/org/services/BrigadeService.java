package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.BrigadeDto;
import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.entities.BuildingType;
import com.kiteiru.construction.org.mapper.BrigadeMapper;
import com.kiteiru.construction.org.repositories.BrigadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BrigadeService {
    private final BrigadeRepository repo;

    private final BrigadeMapper brigadeMapper;

    @Autowired
    public BrigadeService(BrigadeRepository repo, BrigadeMapper brigadeMapper) {
        this.repo = repo;
        this.brigadeMapper = brigadeMapper;
    }
    public List<BrigadeDto> getAll() {
        List<Brigade> brigades = new ArrayList<>(repo.findAll());
        return brigadeMapper.entitiesToDtos(brigades);
    }

    /*public List<BrigadeListDTO> getBrigadeList(Integer objectIdParam) {
        return repo.getBrigadeList(objectIdParam);
    }*/

    /*public List<BrigadeByWorkTypeInPeriodListDTO> getBrigadeByWorkTypeInPeriodList(Integer workTypeIdParam,
                                                                                  Date startDate,
                                                                                  Date endDate,
                                                                                  Integer objectIdParam) {
        return repo.getBrigadeByWorkTypeInPeriodList(workTypeIdParam,
                                                    startDate,
                                                    endDate,
                                                    objectIdParam);
    }*/
}
