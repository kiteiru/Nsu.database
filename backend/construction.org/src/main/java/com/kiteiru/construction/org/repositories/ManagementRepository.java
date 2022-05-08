package com.kiteiru.construction.org.repositories;

import com.kiteiru.construction.org.dto.ManagementInfoDTO;
import com.kiteiru.construction.org.entities.Management;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagementRepository extends JpaRepository<Management, Integer> {

    //@Query(nativeQuery = true, value = "SELECT * FROM get_management_list(" + ");")
    //List<ManagementInfoDTO> GetManagementList();
}
