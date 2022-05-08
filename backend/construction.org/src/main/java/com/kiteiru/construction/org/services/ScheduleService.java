package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.entities.Schedule;
import com.kiteiru.construction.org.repositories.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleService {
    private final ScheduleRepository repo;

    @Autowired
    public ScheduleService(ScheduleRepository repo) {
        this.repo = repo;
    }
    public List<Schedule> getAll() {
        return repo.findAll();
    }
}
