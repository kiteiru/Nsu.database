package com.kiteiru.construction.org.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ObjectDto implements BaseDto {
    private  Integer id;
    private  String name;
    private  String siteName;
}
