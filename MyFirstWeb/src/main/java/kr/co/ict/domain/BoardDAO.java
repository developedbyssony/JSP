package kr.co.ict.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	// �깮�꽦�옄源뚯� 留뚮뱾�뼱二쇱꽭�슂.
	// �씠誘� 而ㅻ꽖�뀡�� �꽕�젙�씠 �릺�뼱�엳�쑝�땲 UserDAO�뿉�꽌 �솢�꽦�솕�맂 肄붾뱶留� 李몄“�빐�꽌
	// �깮�꽦�옄 遺�遺꾧퉴吏�留� �옉�꽦�빐�꽌 ���븳�뀒 蹂대궡二쇱꽭�슂.
	private DataSource ds=null;
	private static BoardDAO dao = new BoardDAO();
	
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	// 寃뚯떆�뙋�쓽 �쟾泥� 湲��쓣 媛��졇�삤�뒗 getBoardList() 硫붿꽌�뱶瑜� �옉�꽦�빐二쇱꽭�슂.
	// �쟾泥� 湲��쓣 媛��졇�삤誘�濡� List<BoardVO> 瑜� 由ы꽩�븯硫� �맗�땲�떎.
	// �옉�꽦�떆 UserDAO�쓽 getAllUserList()硫붿꽌�뱶瑜� 李몄“�빐二쇱꽭�슂.
	public List<BoardVO> getBoardList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;//ResultSet�� �떎�뻾荑쇰━臾몄씠 SELECT 援щЦ�씤 寃쎌슦 寃곌낵媛믪쓣 諛쏄린 �쐞�빐 �븘�슂�빀�땲�떎.
		// 寃곌낵濡� DB�뿉�꽌 爰쇰궡�삱 board�뱾�쓽 紐⑸줉�룄 誘몃━ �꽑�뼵�빐�몼�땲�떎.
		List<BoardVO> boardList = new ArrayList<>();
		
		// �븘�슂�븳 紐⑤뱺 蹂��닔媛� �꽑�뼵�릺�뿀�떎硫� try釉붾윮�쓣 �꽑�뼵�빀�땲�떎.
		try {
			con = ds.getConnection();
			// 荑쇰━臾� ���옣
			String sql = "SELECT * FROM boardTbl";
			// PreparedStatement�뿉 荑쇰━臾� �엯�젰
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 湲� �븯�굹�쓽 �젙蹂대�� �떞�쓣 �닔 �엳�뒗 VO �깮�꽦
				BoardVO board = new BoardVO();
				// �뵒踰꾧퉭�쑝濡� 鍮꾩뼱�엳�뒗寃� �솗�씤
				System.out.println("吏묒뼱�꽔湲� �쟾 : " + board);
				// setter濡� �떎 吏묒뼱�꽔湲�
				// int瑜� 諛쏆븘�삱�븣�뒗 rs.getInt(), Date瑜� 諛쏆븘�삱�븣�뒗 getDate()瑜� �봺�땲�떎.
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));
				// �떎 吏묒뼱�꽔�� �썑 �뵒踰꾧퉭
				System.out.println("吏묒뼱�꽔�� �썑 : " + board);
				// userList�뿉 �뙎湲�
				boardList.add(board);
			}
			System.out.println("由ъ뒪�듃�뿉 �뙎�씤 �옄猷� 泥댄겕 : " + boardList);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return boardList;
	}// getBoardList() �걹�굹�뒗 吏��젏.
	
	// boardTbl에서 row 1개를 가져오거나(글번호 존재 시), 안 가져옴(없는 글 번호 입력 시)
	public BoardVO getBoardDetail(int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = new BoardVO();
		
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM boardTbl WHERE board_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));
			} else {
				System.out.println("계정이 없습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	/*
	public BoardVO insert(int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = new BoardVO();
		
		try {
			con = ds.getConnection();
			String sql = "INSERT INTO boardTbl WHERE board_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));
			} else {
				System.out.println("계정이 없습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	*/
}
