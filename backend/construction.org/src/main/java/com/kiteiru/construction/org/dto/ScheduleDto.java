package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;
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
