package com.plantopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.plantopia.dto.PlantDto;
import com.plantopia.service.PlantService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PlantController {
	@Autowired
	private PlantService plantService;
	
	@RequestMapping("/plantList")
	public String plantList(Model model) throws Exception {
		List<PlantDto> plantList = plantService.selectPlantList();
		model.addAttribute("plantList", plantList);
		return "plantList";
	}
	
	@RequestMapping("/plantWrite")
	public String plantWrite() {
		return "plantWrite";
	}
	
	@RequestMapping("/plantWriteProc")
	public String plantWriteProc( ) throws Exception {
		PlantDto plant = new PlantDto();
		
		
		return "redirect:/plantList";
	}
	
	
}
