package com.sagape.dockercassandrademo.repository;

import com.sagape.dockercassandrademo.model.Book;
import org.springframework.data.cassandra.repository.CassandraRepository;

import java.util.UUID;

public interface BookRepository extends CassandraRepository<Book, UUID> {
}
