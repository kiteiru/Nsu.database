package com.kiteiru.construction.org.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrigadeDto implements BaseDto {
    private Integer id;
    private Integer brigadierWorkerId;
    private String brigadierWorkerSurname;
    private String brigadierWorkerName;
    private String brigadierWorkerPatronymic;
    private String brigadierAttribute;
}
