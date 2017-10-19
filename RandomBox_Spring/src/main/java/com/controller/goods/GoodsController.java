package com.controller.goods;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService service;

	@RequestMapping("/goodsList")
	public String goodsList(HttpSession session) {

		List<GoodsDTO> list = null;
		List<GoodsDTO> tempList = null;

		if (session.getAttribute("goodsList") == null) {
			
			list = service.selectAllGoods();
			session.setAttribute("goodsList", list);
			tempList = list;

			Random rand = new Random();
			List<GoodsDTO> list16 = new ArrayList<>();
			int totalPrice = 0;

			for (int i = 0; i < 16; i++) {
				int idx = rand.nextInt(tempList.size());
				list16.add(tempList.get(idx));
				totalPrice += list16.get(i).getgPrice();
			}
			session.setAttribute("goodsList16", list16);

			// 최종 랜덤 상품 저장 ******
			int randomGoods_idx = rand.nextInt(list16.size());
			GoodsDTO randomGoods = list16.get(randomGoods_idx);

			int resultPrice = (totalPrice / 16) / 10 * 10;
			randomGoods.setgPrice(resultPrice);

			session.setAttribute("randomGoods", randomGoods);
			// ******************
		}

		return "home";
	}
	
	@RequestMapping("/goodsMixList")
	public String goodsMixList(HttpSession session, Model m) {

		List<GoodsDTO> list = (List<GoodsDTO>) session.getAttribute("goodsList");
		Random rand = new Random();
		
		List<GoodsDTO> list16 = new ArrayList<>();
		int totalPrice = 0;

		for (int i = 0; i < 16; i++) {
			int idx = rand.nextInt(list.size());
			list16.add(list.get(idx));
			totalPrice += list16.get(i).getgPrice();
		}
		session.setAttribute("goodsList16", list16);
		
		// 최종 랜덤 상품 저장 ******
		int randomGoods_idx = rand.nextInt(list16.size());
		GoodsDTO randomGoods = list16.get(randomGoods_idx);
		
		int resultPrice = (totalPrice / 16)/10*10;
		randomGoods.setgPrice(resultPrice);
		
		session.setAttribute("randomGoods", randomGoods);
		// ******************
		
		return "home";
	}
	
	@RequestMapping("/goodsMixListByCategory")
	public String goodsMixListByCategory(HttpSession session, @RequestParam String category, Model m) {

		String gCategory = category;
		System.out.println(gCategory);
		List<GoodsDTO> list = (List<GoodsDTO>) session.getAttribute(gCategory);
		System.out.println(list);
		Random rand = new Random();
		
		List<GoodsDTO> listByCategory16 = new ArrayList<>();
		int totalPrice = 0;

		for (int i = 0; i < 16; i++) {
			int idx = rand.nextInt(list.size());
			listByCategory16.add(list.get(idx));
			totalPrice += listByCategory16.get(i).getgPrice();
		}
		String listByCategory = "listBy"+gCategory;
		session.setAttribute(listByCategory, listByCategory16);
		
		// 최종 랜덤 상품 저장 ******
		int randomGoods_idx = rand.nextInt(listByCategory16.size());
		GoodsDTO randomGoods = listByCategory16.get(randomGoods_idx);
		
		int resultPrice = (totalPrice / 16)/10*10;
		randomGoods.setgPrice(resultPrice);
		
		session.setAttribute("randomGoods", randomGoods);
		// ******************
		m.addAttribute("isCategory", session.getAttribute(listByCategory));
		m.addAttribute("gCategory", gCategory);
		
		return "home";
	}
}
