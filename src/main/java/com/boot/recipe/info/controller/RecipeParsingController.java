package com.boot.recipe.info.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.recipe.info.dao.RecipeDao;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

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
			
			JSONParser jsonParser = new JSONParser();
			JSONObject obj = (JSONObject)jsonParser.parse(result);
			
			JSONObject COOKRCP01 = (JSONObject)obj.get("COOKRCP01");
			//System.out.println(COOKRCP01);
			
			JSONArray parse_listArr = (JSONArray)COOKRCP01.get("row");
			//System.out.println(parse_listArr.toString());
			
			list = new ArrayList<RecipeVO>();
			for(int i=0; i<parse_listArr.size(); i++) {
				rvo = new RecipeVO();
				JSONObject recipe = (JSONObject) parse_listArr.get(i);
				rvo.setRcp_seq(Integer.parseInt((String)recipe.get("RCP_SEQ")));
				rvo.setRcp_nm((String)recipe.get("RCP_NM"));
				rvo.setRcp_pat2((String)recipe.get("RCP_PAT2"));
				rvo.setInfo_eng(Integer.parseInt((String)recipe.get("INFO_ENG")));
				rvo.setAtt_file_no_mk((String)recipe.get("ATT_FILE_NO_MK"));
				
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
			JSONParser jsonParser = new JSONParser();
			JSONObject obj = (JSONObject)jsonParser.parse(result);
			
			JSONObject COOKRCP01 = (JSONObject)obj.get("COOKRCP01");
			//System.out.println(COOKRCP01);
			
			JSONArray parse_listArr = (JSONArray)COOKRCP01.get("row");
			//System.out.println(parse_listArr.toString());
			
			for(int i=0; i<parse_listArr.size(); i++) {
				rvo = new RecipeVO();
				rmvo = new RecipeManualVO();
				JSONObject recipe = (JSONObject)parse_listArr.get(i);
				rvo.setRcp_seq(Integer.parseInt((String)recipe.get("RCP_SEQ")));
				rvo.setRcp_nm((String)recipe.get("RCP_NM"));
				rvo.setRcp_pat2((String)recipe.get("RCP_PAT2"));
				rvo.setInfo_eng(Double.parseDouble((String)recipe.get("INFO_ENG")));
				rvo.setAtt_file_no_mk((String)recipe.get("ATT_FILE_NO_MK"));
				rvo.setRcp_parts_dtls((String)recipe.get("RCP_PARTS_DTLS"));
				
				rmvo.setRcp_seq(Integer.parseInt((String)recipe.get("RCP_SEQ")));
				rmvo.setManual01((String)recipe.get("MANUAL01"));
				rmvo.setManual02((String)recipe.get("MANUAL02"));
				rmvo.setManual03((String)recipe.get("MANUAL03"));
				rmvo.setManual04((String)recipe.get("MANUAL04"));
				rmvo.setManual05((String)recipe.get("MANUAL05"));
				rmvo.setManual06((String)recipe.get("MANUAL06"));
				rmvo.setManual07((String)recipe.get("MANUAL07"));
				rmvo.setManual08((String)recipe.get("MANUAL08"));
				rmvo.setManual09((String)recipe.get("MANUAL09"));
				rmvo.setManual10((String)recipe.get("MANUAL10"));
				
				rmvo.setManual_img01((String)recipe.get("MANUAL_IMG01"));
				rmvo.setManual_img02((String)recipe.get("MANUAL_IMG02"));
				rmvo.setManual_img03((String)recipe.get("MANUAL_IMG03"));
				rmvo.setManual_img04((String)recipe.get("MANUAL_IMG04"));
				rmvo.setManual_img05((String)recipe.get("MANUAL_IMG05"));
				rmvo.setManual_img06((String)recipe.get("MANUAL_IMG06"));
				rmvo.setManual_img07((String)recipe.get("MANUAL_IMG07"));
				rmvo.setManual_img08((String)recipe.get("MANUAL_IMG08"));
				rmvo.setManual_img09((String)recipe.get("MANUAL_IMG09"));
				rmvo.setManual_img10((String)recipe.get("MANUAL_IMG10"));
				
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
