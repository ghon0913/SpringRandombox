package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MyPageDAO;
import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.MyPageBoardPageDTO;
import com.dto.OrderInfoDTO;
import com.dto.OrderInfoPageDTO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
	public MemberDTO myPageUserInfo(String userid) {
		return dao.myPageUserInfo(userid);
	}
	
	public void userinfoUpdate(MemberDTO updto) {
		dao.userinfoUpdate(updto);
	}
	
	@Transactional
	public OrderInfoPageDTO myPageOrderInfoPage(HashMap<String, String> map, int curPage) {
		return dao.myPageOrderInfoPage(map,curPage);

	}
	
	@Transactional
	public MyPageBoardPageDTO boardpage(HashMap<String, String> map, int curPage){
		return dao.boardpage(map, curPage);
	}
	

	
	
	/*
	
	public List<BoardDTO> myPageBoardList(String userid) throws MyException {
		MyPageDAO dao = new MyPageDAO();
		SqlSession session = MybatisTemplate.openSession();
		List<BoardDTO> bdto = null;
		try {
			bdto = dao.myPageBoardList(session, userid);
		} catch (Exception e) {
			throw new MyException("myPageBoardList 예외");
		} finally {
			session.close();
		}
		return bdto;
	}
	
	public BoardDTO myPageBoardRetrieve(int bnum) throws MyException {
		MyPageDAO dao = new MyPageDAO();
		SqlSession session = MybatisTemplate.openSession();
		BoardDTO bdto = null;
		try {
			bdto = dao.myPageBoardRetrieve(session, bnum);
		} catch (Exception e) {
			throw new MyException("myPageBoardList 예외");
		} finally {
			session.close();
		}
		return bdto;
	}

	
	
	public void myPageboardupdate(HashMap<String, Object> map) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		
		try {
			int n = dao.myPageboardupdate(session, map);
			if(n==1) session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new MyException("myPageboardupdate 예외");
		}finally {
			session.close();
		}
	}
	
	
	
	public OrderInfoDTO orderinforetrieve(int num) throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		OrderInfoDTO orderdto = null;
		try {
			orderdto = dao.orderinforetrieve(session, num);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("orderinforetrieve 예외");
			
		}finally {
			session.close();
		}
		return orderdto;
	}

	
	
	public GoodsPageDTO goodsinfo(HashMap<String, String> map, int curPage) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		GoodsPageDTO pagedto = null;
		try {
			pagedto = dao.goodsinfo(session,map,curPage);
			System.out.println(pagedto+"service");
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("goodsinfo 예외");
		}finally {
			session.close();
		}
		return pagedto;
	}
	
	public GoodsDTO goodsretrieve(String gCode) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		GoodsDTO dto = null;
		MyPageDAO dao = new MyPageDAO();
		try {
			dto = dao.goodsretrieve(session, gCode);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("goodsretrieve 예외");
		}finally {
			session.close();
		}
		
		
		return dto;
		
	}
	
	public void goodsdelete(String gCode) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		try {
			int n = dao.goodsdelete(session, gCode);
			if(n==1) session.commit();
		}catch(Exception e) {
			throw new MyException("goodsdelete 예외");
		}finally {
			session.close();
		}
	}
	
	public void goodsupdate(HashMap<String, Object> map) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		try {
			int n = dao.goodsupdate(session, map);
			if(n==1) session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("goodsupdate 예외");
		}finally {
			session.close();
		}
	}
	
	public List<SalesStatusDTO> sellinfo(String userid) throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		List<SalesStatusDTO> sdto = null;
		MyPageDAO dao = new MyPageDAO();
		try {
			sdto = dao.sellinfo(session, userid);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("sellinfo 예외");
		}finally {
			session.close();
		}
		return sdto;
	}*/
	
}
