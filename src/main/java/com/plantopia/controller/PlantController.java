package com.plantopia.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		return "Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantWrite")
	public String plantWrite() throws Exception {
		return "Plant/plantWrite";
	}
	
	@RequestMapping("/plantWriteProc")
	public String plantWriteProc(@RequestParam("pla_title") String pla_title,
								 @RequestParam("pla_contents") String pla_contents,
								 @RequestParam("imgFile") MultipartFile imgFile,
								 HttpServletRequest request) throws Exception {
		
		String fileName = null;
		String original_img=null;
		
		if(!imgFile.isEmpty()) {
			fileName = imgFile.getOriginalFilename();
			String uploadPath = "C:/upload/img/plant/";
			File file = new File(uploadPath+fileName);
			imgFile.transferTo(file);
		} else {
			fileName = original_img;
		}
		
		PlantDto plant = PlantDto.builder()
						.pla_title(pla_title)
						.pla_contents(pla_contents)
						.pla_img(fileName)
						.build();
		
		plantService.insertPlant(plant);
		return "redirect:/Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantDetail")
	public String plantDetail(@RequestParam("pla_idx") int pla_idx,Model model) throws Exception {
		PlantDto plant = plantService.selectPlantDetail(pla_idx);
		model.addAttribute("plant", plant);
		
		return "Plant/plantDetail";
	}
	
	@RequestMapping("/Plant/plantUpdate")
	public String plantUpdate(@RequestParam("pla_idx") int pla_idx,Model model) throws Exception {
		PlantDto plant = plantService.selectPlantDetail(pla_idx);
		model.addAttribute("plant", plant);
		return "Plant/plantUpdate";
	}
	
	@RequestMapping("/Plant/plantUpdateProc")
	public String plantUpdateProc(
					 @RequestParam("pla_idx") int pla_idx,
					 @RequestParam("pla_title") String pla_title,
					 @RequestParam("pla_contents") String pla_contents,
					 @RequestParam("imgFile") MultipartFile imgFile,
					 @RequestParam("original_img") String original_img,
					 HttpServletRequest request) throws Exception {

		String fileName = null;
	
		if(!imgFile.isEmpty()) {
			fileName = imgFile.getOriginalFilename();
			String uploadPath = "C:/upload/img/plant/";
			File file = new File(uploadPath+fileName);
			imgFile.transferTo(file);
		} else {
			fileName = original_img;
		}
		
		PlantDto plant = PlantDto.builder()
			.pla_idx(pla_idx)
			.pla_title(pla_title)
			.pla_contents(pla_contents)
			.pla_img(fileName)
			.build();
		
		plantService.updatePlant(plant);
		return "redirect:/Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantdelete")
	public String Plantdelete(@RequestParam("pla_idx") int pla_idx) throws Exception {
		plantService.deletePlant(pla_idx);
		return "redirect:/Plant/plantList";
	}
	
		
	
}
