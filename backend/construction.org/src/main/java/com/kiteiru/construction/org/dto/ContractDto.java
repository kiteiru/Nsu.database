package com.kiteiru.construction.org.dto;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ContractDto implements BaseDto {
    private Integer id;
    private String employerName;
    private String organisationName;
}
