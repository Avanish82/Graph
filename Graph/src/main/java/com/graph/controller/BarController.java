package com.graph.controller;
 
import java.util.List; 
 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.graph.model.BarEntity; 
import com.graph.repository.BarRepository;
 

@Controller
public class BarController {
	
	@Autowired
	BarRepository barRepository;
	
	
	@RequestMapping("")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/barchartshow")
	public String bargraph() {
		return "barchart";
	}

	@RequestMapping("/barchartdata")
	@ResponseBody
	public String barChart(){
		List<BarEntity> dataList = barRepository.findAll();
		JsonArray jsonArrayCategory = new JsonArray();
		JsonArray jsonArraySeries = new JsonArray();
		JsonObject jsonObject = new JsonObject();
		dataList.forEach(data->{
			jsonArrayCategory.add(data.getCategory());
			jsonArraySeries.add(data.getSeries());
		});
		jsonObject.add("categories", jsonArrayCategory);
		jsonObject.add("series", jsonArraySeries);
		return jsonObject.toString();
	}
	 
}
