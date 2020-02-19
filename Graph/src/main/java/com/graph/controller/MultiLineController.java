package com.graph.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.graph.model.MultiLineEntity;
import com.graph.repository.MultiRepository;

@Controller
public class MultiLineController {
	
	@Autowired
	MultiRepository multiRepository;
	
	@GetMapping("/multilinechartshow")
	public String multiLine() {
		return "multilinechart";
	}
	
	@RequestMapping("/multiplelinechartdata")
	public ResponseEntity<?> getDatforMultiLine(){
	 Map<String, List<MultiLineEntity>> mapedData = new HashMap<>();	
	 List<MultiLineEntity> multipleList = multiRepository.findAll();
	 for(MultiLineEntity data : multipleList) {
		 
		 if(mapedData.containsKey(data.getName())) {
			 mapedData.get(data.getName()).add(data);
		 }else {
			 List<MultiLineEntity> tempList = new ArrayList<>();
			 tempList.add(data);
			 mapedData.put(data.getName(), tempList);
		 }
			 
		 }
	 return new ResponseEntity<>(mapedData, HttpStatus.OK);
	 
	 }

}
