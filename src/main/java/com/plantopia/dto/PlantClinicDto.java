package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlantClinicDto {
	private int plc_idx;
    private String plc_title;
    private String growing_loc;
    private String growth_con;
    private String watering;
    private String last_rep;
    private String last_fert;
    private String last_pruned;
    private String plant_pos;
    private String pest_dmg;
    private String discolored;
    private String plc_contents;
    private String plc_img;
    private LocalDateTime plc_date;
    private int plc_hit_cnt;
    private int user_num;      // 작성자 ID (FK)
    private String writer;     // 닉네임 (조회 시 사용)
}
