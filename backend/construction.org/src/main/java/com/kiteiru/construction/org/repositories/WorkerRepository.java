package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.entities.Worker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkerRepository extends JpaRepository<Worker, Integer> {
    public List<Worker> findBySurname(String surname);

    public List<Worker> findByName(String name);

    public List<Worker> findByPatronymic(String patronymic);

    @Query("SELECT w.surname FROM Worker w " +
            "INNER JOIN EngineerTechStaff AS e ON w.id = e.id " +
            "INNER JOIN Site AS s ON e.headId = s.headId")
    public List<Worker> getAllWorkersUsingJPAQL();
}