package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.boardDTO;

public class boardDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardDTO dto = null;
	boardDTO board_info = null;

	int cnt = 0;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			// @localhost -> @121.147.52.216
			// 소연 ip : 121.147.52.216
			// 준오 ip : 121.147.52.104
			// 유종 ip : 121.147.52.230
			// 진영 ip : 210.223.239.240
			String dbid = "campus_f6";
			String dbpw = "smhrd6";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void showboard() {

	}

	public int upload(boardDTO dto) {
		try {
			conn();
			String sql = "INSERT INTO board(board_num,member_id,board_date,board_content,board_title,board_image) VALUES(num_board1.nextval,?, sysdate, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getBoardContent());
			psmt.setString(3, dto.getBoardTitle());
			psmt.setString(4, dto.getBoardImage());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 게시번호에 맞는 게시글 정보들 dto에 담는 메소드
	public boardDTO showOne(int boardNum) {
		try {
			conn();
			String sql = "SELECT * FROM board WHERE board_num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNum);
			rs = psmt.executeQuery();
			System.out.println("board_num");
			if (rs.next()) {
				String memberId = rs.getString(2);
				String boardDate = rs.getString(3);
				String boardContent = rs.getString(4);
				String boardTitle = rs.getString(5);
				String boardImage = rs.getString(6);

				dto = new boardDTO(boardNum, memberId, boardDate, boardContent, boardTitle, boardImage);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public ArrayList<boardDTO> showBoard(String id) {
		ArrayList<boardDTO> board_list = new ArrayList<boardDTO>();

		try {
			conn();

			String sql = "SELECT * FROM board WHERE member_id = ? ORDER BY board_date DESC";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int board_num = rs.getInt(1);
				String memberId = rs.getString(2);
				String boardDate = rs.getString(3);
				String boardContent = rs.getString(4);
				String boardTitle = rs.getString(5);
				String boardImage = rs.getString(6);

				boardDTO dto = new boardDTO(board_num, memberId, boardDate, boardContent, boardTitle, boardImage);
				board_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_list;

	}

	public boardDTO showboard(int num) {
		try {
			conn();
			String sql = "SELECT * FROM board";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int board_num = rs.getInt(1);
				String memberId = rs.getString(2);
				String boardDate = rs.getString(3);
				String boardContent = rs.getString(4);
				String boardTitle = rs.getString(5);
				String boardImage = rs.getString(6);

				dto = new boardDTO(board_num, memberId, boardDate, boardContent, boardTitle, boardImage);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public boardDTO viewboard(int board_num) {
		try {
			conn();
			String sql = "select * from board where board_num = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, board_num);

			rs = psmt.executeQuery();

			if (rs.next()) {

				String memberId = rs.getString(2);
				String boardDate = rs.getString(3);
				String boardContent = rs.getString(4);
				String boardTitle = rs.getString(5);
				String boardImage = rs.getString(6);

				board_info = new boardDTO(board_num, memberId, boardDate, boardContent, boardTitle, boardImage);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_info;

	}

	public ArrayList<boardDTO> board_li() {
		ArrayList<boardDTO> board_list = new ArrayList<boardDTO>();
		try {
			conn();
			String sql = "SELECT * FROM board ORDER BY board_date DESC";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int board_num = rs.getInt(1);
				String memberId = rs.getString(2);
				String boardDate = rs.getString(3);
				String boardContent = rs.getString(4);
				String boardTitle = rs.getString(5);
				String boardImage = rs.getString(6);

				boardDTO dto = new boardDTO(board_num, memberId, boardDate, boardContent, boardTitle, boardImage);
				board_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_list;

	}

	public int deleteOneboard(int num) {
		try {
			conn();
			String sql = "DELETE FROM board WHERE board_num = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, num);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

// public boardDTO showboard1() {
//     try {
//        conn();
//        String sql = "SELECT * FROM board";
//        
//        psmt = conn.prepareStatement(sql);
//        rs = psmt.executeQuery();
//        
//        if(rs.next()) {
//           int board_num = rs.getInt(1);
//           String memberId = rs.getString(2);
//           String boardDate = rs.getString(3);
//           String boardContent = rs.getString(4);
//           String boardTitle = rs.getString(5);
//           String boardImage = rs.getString(6);
//           
//           dto = new boardDTO(board_num, memberId, boardDate, boardContent, boardTitle, boardImage);
//           
//        }
//     } catch (SQLException e) {
//        e.printStackTrace();
//     } finally {
//        close();
//     } return dto;
//  }
}
