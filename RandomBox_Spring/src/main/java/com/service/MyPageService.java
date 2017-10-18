package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MyPageDAO;
import com.dto.MemberDTO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
	public MemberDTO myPageUserInfo(String userid) {
		return dao.myPageUserInfo(userid);
	}
	
	/*
	public MemberDTO myPageUserInfo(String userid) throws MyException {
		MyPageDAO dao = new MyPageDAO();
		SqlSession session = MybatisTemplate.openSession();
		try {
			MemberDTO dto = dao.myPageUserInfo(session, userid);
			return dto;
		} catch (Exception e) {
			throw new MyException("myPageUserInfo 예외");
		} finally {
			session.close();
		}
	}

	public void updateuserinfo(MemberDTO updto) throws MyException {
		MyPageDAO dao = new MyPageDAO();
		SqlSession session = MybatisTemplate.openSession();
		try {
			int n = dao.updateuserinfo(session, updto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw new MyException("updateuserinfo 예외");
		} finally {
			session.close();
		}
	}

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

	public MyPageBoardPageDTO boardpage(HashMap<String, String> map, int curPage) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		MyPageBoardPageDTO pagedto = null;
		try {
			pagedto = dao.boardpage(session,map,curPage);
			System.out.println(pagedto+"service");
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("boardpage 예외");
		}finally {
			session.close();
		}
		return pagedto;
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
	
	public List<OrderInfoDTO> myPageOrderInfo(String userid) throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		List<OrderInfoDTO> orderdto = null;
		try {
			orderdto = dao.myPageOrderInfo(session, userid);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("myPageOrderInfo 예외");
			
		}finally {
			session.close();
		}
		return orderdto;
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

	public OrderInfoPageDTO myPageOrderInfoPage(HashMap<String, String> map, int curPage) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		MyPageDAO dao = new MyPageDAO();
		OrderInfoPageDTO pagedto = null;
		try {
			pagedto = dao.myPageOrderInfoPage(session,map,curPage);
			System.out.println(pagedto+"service");
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("myPageOrderInfoPage 예외");
		}finally {
			session.close();
		}
		return pagedto;
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
