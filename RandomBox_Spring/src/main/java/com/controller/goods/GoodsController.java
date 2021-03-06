package com.controller.goods;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dto.FileDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService service;

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/goodsRegisterForm")
	public String goodsRegisterForm() {
		return "goodsRegisterForm";
	}

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

		return "goodsList";
	}

	@RequestMapping("/goodsListByCategory")
	public String goodsListByCategory(HttpSession session, HttpServletRequest request, @RequestParam String category,
			Model m) {

		String listByCategory = "listBy" + category;
		List<GoodsDTO> tempList = null;
		List<GoodsDTO> listByCategory16 = new ArrayList<>();
		int totalPrice = 0;

		Random rand = new Random();
		if (session.getAttribute("goodsListBy" + category) == null) {
			List<GoodsDTO> list = null;

			list = service.selectByCategory(category);
			session.setAttribute("goodsListBy" + category, list);
			tempList = list;
			for (int i = 0; i < 16; i++) {
				int idx = rand.nextInt(tempList.size());
				listByCategory16.add(tempList.get(idx));
				totalPrice += listByCategory16.get(i).getgPrice();
			}

			session.setAttribute(listByCategory, listByCategory16);

			// 최종 랜덤 상품 저장 ******
			int randomGoods_idx = rand.nextInt(listByCategory16.size());
			String randomGoodsByCategory = "randomGoodsBy" + category;
			GoodsDTO randomGoods = listByCategory16.get(randomGoods_idx);

			int resultPrice = (totalPrice / 16) / 10 * 10;
			randomGoods.setgPrice(resultPrice);

			session.setAttribute(randomGoodsByCategory, randomGoods);
			System.out.println(session.getAttribute(randomGoodsByCategory));
			// ******************

		}
		m.addAttribute("isCategory", session.getAttribute(listByCategory));
		m.addAttribute("gCategory", category);
		return "goodsList";

	}

	@RequestMapping("/goodsMixList")
	public @ResponseBody HashMap<String, Object> goodsMixList(HttpSession session, Model m) {

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

		int resultPrice = (totalPrice / 16) / 10 * 10;
		randomGoods.setgPrice(resultPrice);

		session.setAttribute("randomGoods", randomGoods);
		// ******************
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("goodsList16", list16);
		map.put("randomGoods", randomGoods);

		return map;
	}

	@RequestMapping("/goodsMixListByCategory")
	public @ResponseBody String goodsMixListByCategory(HttpSession session, @RequestParam(value="category") String category, Model m) {
		System.out.println(category);
		String goodsListByCategory = "goodsListBy" + category;
		List<GoodsDTO> list = (List<GoodsDTO>) session.getAttribute(goodsListByCategory);
		System.out.println(list);
		Random rand = new Random();

		List<GoodsDTO> listByCategory16 = new ArrayList<>();
		int totalPrice = 0;

		for (int i = 0; i < 16; i++) {
			int idx = rand.nextInt(list.size());
			listByCategory16.add(list.get(idx));
			totalPrice += listByCategory16.get(i).getgPrice();
		}
		String listByCategory = "listBy" + category;
		session.setAttribute(listByCategory, listByCategory16);

		// 최종 랜덤 상품 저장 ******
		int randomGoods_idx = rand.nextInt(listByCategory16.size());
		String randomGoodsByCategory = "randomGoodsBy" + category;
		GoodsDTO randomGoods = listByCategory16.get(randomGoods_idx);

		int resultPrice = (totalPrice / 16) / 10 * 10;
		randomGoods.setgPrice(resultPrice);

		session.setAttribute(randomGoodsByCategory, randomGoods);
		// ******************

		m.addAttribute("isCategory", session.getAttribute(listByCategory));
		m.addAttribute("gCategory", category);

		return "";
	}

	@RequestMapping("/goodsBySearch")
	public String goodsBySearch(HttpServletRequest request, Model m) {

		String searchWord = request.getParameter("searchBar");
	
		List<GoodsDTO> list = null;
		list = service.selectBySearch(searchWord);
		m.addAttribute("search", list);
		m.addAttribute("searchWord",searchWord);
		return "goodsBySearch";
	}

	@RequestMapping("/goodsRegister")
	public ModelAndView goodsRegister(FileDTO dto, HttpSession session) {
		UUID uuid1 = UUID.randomUUID();
		UUID uuid2 = UUID.randomUUID();
		String gCategory = dto.getgCategory();
		String gName = dto.getgName();
		int gPrice = dto.getgPrice();
		int gAmount = dto.getgAmount();
		CommonsMultipartFile gImage = dto.getgImage();
		CommonsMultipartFile gContentImage = dto.getgContentImage();
		MemberDTO m_dto = (MemberDTO) session.getAttribute("login");
		String sellerId = m_dto.getUserid();
		GoodsDTO g_dto = new GoodsDTO(gPrice, null, gCategory, gName,
				uuid1.toString() + "_" + gImage.getOriginalFilename(),
				uuid2.toString() + "_" + gContentImage.getOriginalFilename(), gAmount, sellerId);
		service.insertGoods(g_dto);
		String saveFile1 = uuid1.toString() + "_" + gImage.getOriginalFilename();
		String saveFile2 = uuid2.toString() + "_" + gContentImage.getOriginalFilename();
		File f = new File("c:\\upload", saveFile1);
		File f2 = new File("c:\\upload", saveFile2);

		try {
			gImage.transferTo(f);
			gContentImage.transferTo(f2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsConfirm", g_dto);
		mav.setViewName("goodsRegisterConfirm");

		return mav;
	}
	
	@RequestMapping("/deleteGoods")
	public @ResponseBody String deleteGoods(@RequestParam String gCode) {
		
		service.deleteGoods(gCode);
		return gCode;
	}
		
}
