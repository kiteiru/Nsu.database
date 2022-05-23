package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.queries.BrigadeListDTO;
import com.kiteiru.construction.org.dto.queries.BrigadeByWorkTypeInPeriodListDTO;
import com.kiteiru.construction.org.entities.Brigade;
import com.kiteiru.construction.org.repositories.BrigadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class BrigadeService {
    private final BrigadeRepository repo;

    @Autowired
    public BrigadeService(BrigadeRepository repo) {
        this.repo = repo;
    }
    public List<Brigade> getAll() {
        return repo.findAll();
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
