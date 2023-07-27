package com.edu.teamproject.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.edu.teamproject.domain.Shelter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AnimalAPI {
	int index=0;
	
    public Map ShelterApi(String currentPage) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=eadQ%2BhlQVwB7SLcGh6fSyUL0usF0DiqK%2BPZzQrvl8rrMyc5CR1E3UvvPAMzq%2BkqAeXk4ue3re%2BO1RN9V3whrTA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보호센터등록번호*/
        urlBuilder.append("&" + URLEncoder.encode("care_nm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*동물보호센터명*/
        
        //pageSize
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수 (1,000 이하)*/
        
        //currentPage
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(currentPage, "UTF-8")); /*페이지 번호*/
        
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(기본값) 또는 json*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        //System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        JSONParser parser = new JSONParser();
        Object obj=null;
		try {
			obj = parser.parse(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
        JSONObject json = (JSONObject) obj;
        

        JSONObject response=(JSONObject)json.get("response");
        JSONObject body=(JSONObject)response.get("body");
        JSONObject items=(JSONObject)body.get("items");
        JSONArray itemList = (JSONArray)items.get("item");
        
        
        List<Shelter> shelterList = new ArrayList<Shelter>();
        
        index=Integer.valueOf(body.get("totalCount").toString())- (Integer.valueOf(currentPage)-1)*10;
        
        for(int a=0;a<itemList.size();a++) {
        	JSONObject item=(JSONObject)itemList.get(a);  
        	Shelter shelter = new Shelter();
        	
        	shelter.setShelter_idx(index-a);
        	shelter.setLoc((String)item.get("orgNm"));
        	shelter.setName((String)item.get("careNm"));
        	shelter.setPhone((String)item.get("careTel"));
        	
        	if(item.get("lat")!=null && item.get("lng")!=null) {
	        	shelter.setLat(Double.parseDouble(item.get("lat").toString()));
	        	shelter.setLng(Double.parseDouble(item.get("lng").toString()));
        	}
        	
        	shelterList.add(shelter);
        }
        
        String totalCount=body.get("totalCount").toString();
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("shelterList", shelterList);
        map.put("totalCount", totalCount);
        //토탈 레코드	
        
        System.out.println(shelterList);
        return map;
    }
}