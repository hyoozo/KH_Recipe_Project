package com.boot.recipe.info.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.recipe.info.dao.RecipeDao;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;
import com.google.gson.JsonParser;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.Setter;

@Controller
@RequestMapping("/recipe/json/*")
public class RecipeParsingController {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao recipeDao;
	
	@GetMapping("/list")
	public String recipeList(Model model) {
		RecipeVO rvo = null;
		List<RecipeVO> list = null;
		
		try {
			
			String urlStr = "https://openapi.foodsafetykorea.go.kr/api/eed33eda3cbf4149b992/COOKRCP01/json/1/10";
			
			URL url = new URL(urlStr);
			
			String line = "";
			String result = "";
			
			BufferedReader br = 
					new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			while((line = br.readLine()) != null) {
				result = result.concat(line);
				System.out.println(line);
			}
			
			
			JsonObject obj = JsonParser.parseString(result).getAsJsonObject();
			
			JsonObject COOKRCP01 = obj.get("COOKRCP01").getAsJsonObject();
			//System.out.println(COOKRCP01);
			
			JsonArray parse_listArr = COOKRCP01.get("row").getAsJsonArray();
			//System.out.println(parse_listArr.toString());
			
			list = new ArrayList<RecipeVO>();
			for(int i=0; i<parse_listArr.size(); i++) {
				rvo = new RecipeVO();
				JsonObject recipe = (JsonObject) parse_listArr.get(i);
				rvo.setRcp_seq(Integer.parseInt(recipe.get("RCP_SEQ").getAsString()));
				rvo.setRcp_nm(recipe.get("RCP_NM").getAsString());
				rvo.setRcp_pat2(recipe.get("RCP_PAT2").getAsString());
				rvo.setInfo_eng(Integer.parseInt(recipe.get("INFO_ENG").getAsString()));
				rvo.setAtt_file_no_mk(recipe.get("ATT_FILE_NO_MK").getAsString());
				
				list.add(rvo);
			}
			
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("recipe", list);
		
		return "recipe/list";
	}
	
	@GetMapping("/insert")
	public String insertRecipe(@RequestParam("start") String start, @RequestParam("end") String end) {
		RecipeVO rvo = null;
		RecipeManualVO rmvo = null;
		
		try {
			
			String urlStr = "https://openapi.foodsafetykorea.go.kr/api/eed33eda3cbf4149b992/COOKRCP01/json/" + start + "/" + end;
			
			URL url = new URL(urlStr);
			
			String line = "";
			String result = "";
			
			BufferedReader br = 
					new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			while((line = br.readLine()) != null) {
				result = result.concat(line);
				//System.out.println(line);
			}
			
			JsonObject obj = JsonParser.parseString(result).getAsJsonObject();
			
			JsonObject COOKRCP01 = obj.get("COOKRCP01").getAsJsonObject();
			//System.out.println(COOKRCP01);
			
			JsonArray parse_listArr = COOKRCP01.get("row").getAsJsonArray();
			//System.out.println(parse_listArr.toString());
			
			for(int i=0; i<parse_listArr.size(); i++) {
				rvo = new RecipeVO();
				rmvo = new RecipeManualVO();
				JsonObject recipe = parse_listArr.get(i).getAsJsonObject();
				rvo.setRcp_seq(Integer.parseInt(recipe.get("RCP_SEQ").getAsString()));
				rvo.setRcp_nm(recipe.get("RCP_NM").getAsString());
				rvo.setRcp_pat2(recipe.get("RCP_PAT2").getAsString());
				rvo.setInfo_eng(Double.parseDouble(recipe.get("INFO_ENG").getAsString()));
				rvo.setAtt_file_no_mk(recipe.get("ATT_FILE_NO_MK").getAsString());
				rvo.setRcp_parts_dtls(recipe.get("RCP_PARTS_DTLS").getAsString());
				
				rmvo.setRcp_seq(Integer.parseInt(recipe.get("RCP_SEQ").getAsString()));
				rmvo.setManual01(recipe.get("MANUAL01").getAsString());
				rmvo.setManual02(recipe.get("MANUAL02").getAsString());
				rmvo.setManual03(recipe.get("MANUAL03").getAsString());
				rmvo.setManual04(recipe.get("MANUAL04").getAsString());
				rmvo.setManual05(recipe.get("MANUAL05").getAsString());
				rmvo.setManual06(recipe.get("MANUAL06").getAsString());
				rmvo.setManual07(recipe.get("MANUAL07").getAsString());
				rmvo.setManual08(recipe.get("MANUAL08").getAsString());
				rmvo.setManual09(recipe.get("MANUAL09").getAsString());
				rmvo.setManual10(recipe.get("MANUAL10").getAsString());
				
				rmvo.setManual_img01(recipe.get("MANUAL_IMG01").getAsString());
				rmvo.setManual_img02(recipe.get("MANUAL_IMG02").getAsString());
				rmvo.setManual_img03(recipe.get("MANUAL_IMG03").getAsString());
				rmvo.setManual_img04(recipe.get("MANUAL_IMG04").getAsString());
				rmvo.setManual_img05(recipe.get("MANUAL_IMG05").getAsString());
				rmvo.setManual_img06(recipe.get("MANUAL_IMG06").getAsString());
				rmvo.setManual_img07(recipe.get("MANUAL_IMG07").getAsString());
				rmvo.setManual_img08(recipe.get("MANUAL_IMG08").getAsString());
				rmvo.setManual_img09(recipe.get("MANUAL_IMG09").getAsString());
				rmvo.setManual_img10(recipe.get("MANUAL_IMG10").getAsString());
				
				recipeDao.insertRecipeInfo(rvo);
				recipeDao.insertRecipeManual(rmvo);
			}
			
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/recipe/json/list";
	}
}
