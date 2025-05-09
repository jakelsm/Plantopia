package com.plantopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.PlantDto;
import com.plantopia.service.PlantService;

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
	public String plantWrite() throws Exception {
		return "plantWrite";
	}
	
	@RequestMapping("/plantWriteProc")
	public String plantWriteProc(PlantDto plant) throws Exception {
		plantService.insertPlant(plant);
		return "redirect:/plantList";
	}
	
	@RequestMapping("/plantDetail")
	public String plantDetail(@RequestParam("plaIdx") int plaIdx,Model model) throws Exception {
		PlantDto plant = plantService.selectPlantDetail(plaIdx);
		model.addAttribute("plant", plant);
		
		return "plantDetail";
	}
	
}
