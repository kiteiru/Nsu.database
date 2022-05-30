package com.kiteiru.construction.org.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleDto implements BaseDto {
    private Integer id;
    private String objectName;
    private String workTypeName;
    private LocalDate deadline;
    private LocalDate actualDate;
}
