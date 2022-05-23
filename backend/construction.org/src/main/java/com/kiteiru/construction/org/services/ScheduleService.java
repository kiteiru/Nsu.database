package com.kiteiru.construction.org.services;

import com.kiteiru.construction.org.dto.ScheduleDto;
import com.kiteiru.construction.org.entities.Object;
import com.kiteiru.construction.org.entities.Schedule;
import com.kiteiru.construction.org.mapper.ScheduleMapper;
import com.kiteiru.construction.org.repositories.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ScheduleService {
    private final ScheduleRepository repo;

    private final ScheduleMapper scheduleMapper;

    @Autowired
    public ScheduleService(ScheduleRepository repo, ScheduleMapper scheduleMapper) {
        this.repo = repo;
        this.scheduleMapper = scheduleMapper;
    }
    public List<ScheduleDto> getAll() {
        List<Schedule> schedules =  new ArrayList<>(repo.findAll());
        return scheduleMapper.entitiesToDtos(schedules);
    }
}
