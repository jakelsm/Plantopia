package com.plantopia.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ssl.SslProperties.Bundles.Watch.File;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.plantopia.dto.PlantDto;
import com.plantopia.service.PlantService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PlantController {
	@Autowired
	private PlantService plantService;
	
	@RequestMapping("/Plant/plantList")
	public String plantList(Model model) throws Exception {
		List<PlantDto> plantList = plantService.selectPlantList();
		model.addAttribute("plantList", plantList);
		return "/Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantWrite")
	public String plantWrite() throws Exception {
		return "/Plant/plantWrite";
	}
	
	@RequestMapping("/plantWriteProc")
	public String plantWriteProc(PlantDto plant, 
			@RequestParam("uploadFile") MultipartFile uploadFile,
			HttpServletRequest request) throws Exception {
		
		
		plantService.insertPlant(plant);
		return "redirect:/Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantDetail")
	public String plantDetail(@RequestParam("plaIdx") int plaIdx,Model model) throws Exception {
		PlantDto plant = plantService.selectPlantDetail(plaIdx);
		model.addAttribute("plant", plant);
		
		return "/Plant/plantDetail";
	}
	
	@RequestMapping("/Plant/plantdelete")
	public String Plantdelete(@RequestParam("plaIdx") int plaIdx) throws Exception {
		plantService.deletePlant(plaIdx);
		return "redirect:/Plant/plantList";
	}
	
		
	
}
