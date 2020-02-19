package com.graph.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.graph.model.PieEntity;
import com.graph.repository.PieRepository;

@Controller
public class PieController {
	
	@Autowired
	PieRepository pieRepository;

	@RequestMapping("/piechartshow")
	public String showHome(){
		return "piechart";
	}
	
	@RequestMapping("/piechartdata")
	public ResponseEntity<?> getDataForPiechart(){
		List<PieEntity> pieEntity = pieRepository.findAll();
		return new ResponseEntity<>(pieEntity, HttpStatus.OK);
	}
    
}
