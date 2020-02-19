package com.graph.repository;

import java.util.Map;
 
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.graph.model.BarEntity;

@Repository
public interface BarRepository extends JpaRepository<BarEntity, Integer>{
	
	public BarEntity findByCategory(Integer id);

}
