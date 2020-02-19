package com.graph.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.graph.model.BarEntity;

public class CollectionController {
	
	
	
	
	// Map Example
	
	@RequestMapping("/mapchartdata")
	@ResponseBody
	public ResponseEntity<?> getDatforBar(){
	 Map<String, List<BarEntity>> mapedData = new HashMap<>();	
	 List<BarEntity> barList = barRepository.findAll();
	 for(BarEntity data : barList) {
		 
		 if(mapedData.containsKey(data.getSeries())) {
			 mapedData.get(data.getSeries()).add(data);
		 }else {
			 List<BarEntity> tempList = new ArrayList<>();
			 tempList.add(data);
			 mapedData.put(data.getSeries(), tempList);
		 }
			 
		 }

}
