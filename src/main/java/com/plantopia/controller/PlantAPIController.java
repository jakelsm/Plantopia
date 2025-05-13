package com.plantopia.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PlantAPIController {
	
	@RequestMapping("/gardenList")
	public String gardenList() {
	    return "PlantAPI/gardenList";
	}
	
	@RequestMapping("gardenDtl")
	public String detail(@RequestParam("cntntsNo") String cntntsNo, Model model) {
	    model.addAttribute("cntntsNo", cntntsNo);
	    return "PlantAPI/gardenDtl"; 
	}
}
