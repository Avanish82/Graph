package com.graph.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.graph.model.LineEntity;
import com.graph.repository.LineRepository;

@Controller
public class LineController {
	
	@Autowired
	LineRepository lineRepository;
	
	 
	@RequestMapping("/linechartshow")
	public String showLine() {
		return "linechart";
	}
	
	
	@RequestMapping("/linechartdata")
	@ResponseBody
	public String getDataFromDB(){
		List<LineEntity> dataList = lineRepository.findAll();
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
