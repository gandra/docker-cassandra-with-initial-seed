package com.sagape.dockercassandrademo.model;

import org.springframework.data.cassandra.core.cql.PrimaryKeyType;
import org.springframework.data.cassandra.core.mapping.Column;
import org.springframework.data.cassandra.core.mapping.PrimaryKeyColumn;
import org.springframework.data.cassandra.core.mapping.Table;

import java.util.UUID;

@Table
@lombok.Data
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Book {
    @PrimaryKeyColumn(type = PrimaryKeyType.PARTITIONED)
    private UUID id;

    @Column
    private String title;
}
