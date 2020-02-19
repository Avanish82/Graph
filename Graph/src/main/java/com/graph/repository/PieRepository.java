package com.graph.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.graph.model.PieEntity;

@Repository
public interface PieRepository extends JpaRepository<PieEntity, Integer>{

}
