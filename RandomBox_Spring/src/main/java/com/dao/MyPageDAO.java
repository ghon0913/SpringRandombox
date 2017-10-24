package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.GoodsDTO;
import com.dto.GoodsPageDTO;
import com.dto.MemberDTO;
import com.dto.MyPageBoardPageDTO;
import com.dto.OrderInfoDTO;
import com.dto.OrderInfoPageDTO;
import com.dto.SalesStatusDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDTO myPageUserInfo(String userid) {
		return template.selectOne("com.mybatis.MyPageMapper.mypageuserinfo",userid);
	}
	
	public void userinfoUpdate(MemberDTO updto) {
		template.update("com.mybatis.MyPageMapper.updateuserinfo",updto);
	}
	
	public List<OrderInfoDTO> myPageOrderInfo(String userid) {
		return template.selectList("myPageOrderInfo", userid);
	}
	
	
	public OrderInfoPageDTO myPageOrderInfoPage(HashMap<String, String> map, int curPage) {

		OrderInfoPageDTO pagedto = new OrderInfoPageDTO();

		int sIndex = (curPage - 1) * OrderInfoPageDTO.getPerPage();
		int length = OrderInfoPageDTO.getPerPage();
		List<OrderInfoDTO> list = null;
		if (map.get("startdate") == null) {
			list = template.selectList("com.mybatis.MyPageMapper.myPageOrderInfodifPage", map,
					new RowBounds(sIndex, length));
		}else if(map.get("startdate").equals(map.get("finaldate"))) {
			list = template.selectList("com.mybatis.MyPageMapper.myPageOrderInfosamePage", map,
					new RowBounds(sIndex, length));
		}else {
			list = template.selectList("com.mybatis.MyPageMapper.myPageOrderInfodifPage", map,
					new RowBounds(sIndex, length));
		}
		

		// pagedto에 저장하기
		int totalPage = 0;
		pagedto.setOlist(list);
		pagedto.setCurPage(curPage);
		if (map.get("startdate") == null) {
			totalPage = template.selectOne("com.mybatis.MyPageMapper.totalorderPage", map.get("userId"));
		} else if(map.get("startdate").equals(map.get("finaldate"))) {
			totalPage = template.selectOne("com.mybatis.MyPageMapper.samedateorderPage", map);
			System.out.println("ddddddddddddddd");
		} else{
			totalPage = template.selectOne("com.mybatis.MyPageMapper.difdateorderPage",map);
		}
		pagedto.setTotalPage(totalPage);
		return pagedto;
	}
	
	public MyPageBoardPageDTO boardpage(HashMap<String, String> map, int curPage) {
		MyPageBoardPageDTO pagedto = new MyPageBoardPageDTO();
		int sIndex = (curPage - 1) * MyPageBoardPageDTO.getPerPage();
		int length = MyPageBoardPageDTO.getPerPage();

		List<BoardDTO> list = template.selectList("myPageBoardsearch", map,new RowBounds(sIndex, length));
		// pagedto에 저장하기
		int totalPage = 0;
		pagedto.setBlist(list);
		pagedto.setCurPage(curPage);
		if (map.get("searchValue") == null) {
			totalPage = template.selectOne("com.mybatis.MyPageMapper.totalPage", map.get("userId"));
		} else {
			totalPage = template.selectOne("com.mybatis.MyPageMapper.searchPage", map);
		}
		pagedto.setTotalPage(totalPage);
		return pagedto;
	}
	
	
	
	/*

	public BoardDTO myPageBoardRetrieve(SqlSession session, int bnum) {
		BoardDTO bdto = session.selectOne("com.mybatis.MyPageMapper.myPageBoardRetrieve", bnum);
		return bdto;
	}

	

	public int myPageboardupdate(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("myPageboardupdate", map);
		return n;
	}

	public List<OrderInfoDTO> myPageOrderInfo(SqlSession session, String userid) {
		List<OrderInfoDTO> orderdto = session.selectList("myPageOrderInfo", userid);
		return orderdto;
	}

	public OrderInfoDTO orderinforetrieve(SqlSession session, int num) {
		OrderInfoDTO orderdto = session.selectOne("orderinforetrieve", num);
		return orderdto;
	}

	
	
	public GoodsPageDTO goodsinfo(SqlSession session, HashMap<String, String> map, int curPage) {
		// TODO Auto-generated method stub

		GoodsPageDTO pagedto = new GoodsPageDTO();

		int sIndex = (curPage - 1) * GoodsPageDTO.getPerPage();
		int length = GoodsPageDTO.getPerPage();

		List<GoodsDTO> list = session.selectList("com.mybatis.MyPageMapper.goodsinfo", map,new RowBounds(sIndex, length));
		System.out.println(list + "dao list");
		System.out.println(pagedto.getGlist());
		// pagedto에 저장하기
		int totalPage = 0;
		pagedto.setGlist(list);
		pagedto.setCurPage(curPage);
		if (map.get("searchName") == null) {
			totalPage = session.selectOne("com.mybatis.MyPageMapper.totalgoodsinfo", map.get("userId"));
		} else {
			totalPage = session.selectOne("com.mybatis.MyPageMapper.searchgoodsinfo", map);
		}

		pagedto.setTotalPage(totalPage);
		pagedto.setSearchName(map.get("searchName"));
		pagedto.setSearchValue(map.get("searchValue"));

		return pagedto;
	}
	
	
	public GoodsDTO goodsretrieve(SqlSession session,String gCode) {
		GoodsDTO dto = session.selectOne("goodsretrieve",gCode);
		return dto;
		
	}
	
	public int goodsdelete(SqlSession session, String gCode) {
		int n = session.delete("goodsdelete",gCode);
		return n;
	}
	
	public int goodsupdate(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("goodsupdate",map);
		return n;
	}
	
	public List<SalesStatusDTO> sellinfo(SqlSession session, String userid) {
		List<SalesStatusDTO> sdto = session.selectList("sellinfo",userid);
		System.out.println(sdto);
		return sdto;
	}
	
	*/

}
