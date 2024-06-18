package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class boardReDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardReDTO dto = null;

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

	public int upload(boardReDTO dto) {
		try {
			conn();
			String sql = "INSERT INTO board_num VALUES(num_board_num.nextval,?,?,?,?,sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getBoardNum());
			psmt.setString(2, dto.getMemberID());
			psmt.setString(3, dto.getCommentsPw());
			psmt.setString(4, dto.getCommentsContents());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public boardReDTO showOne(int commentsNumber) {
		try {
			conn();
			String sql = "SELECT * FROM board WHERE board_num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commentsNumber);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int boardNum = rs.getInt(2);
				String memberID = rs.getString(3);
				String commentsPw = rs.getString(4);
				String commentsContents = rs.getString(5);
				String commentsDate = rs.getString(6);

				dto = new boardReDTO(commentsNumber, boardNum, memberID, commentsPw, commentsContents, commentsDate);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public ArrayList<boardReDTO> showMember() {
		ArrayList<boardReDTO> boardRe_list = new ArrayList<boardReDTO>();
		try {
			conn();
			String sql = "select * from board_num";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int commentsNumber = rs.getInt(1);
				String memberID = rs.getString(2);
				String commentsPw = rs.getString(3);
				String commentsContents = rs.getString(4);
				String commentsDate = rs.getString(5);

				boardReDTO dto = new boardReDTO(commentsNumber, memberID, commentsPw, commentsContents, commentsDate);
				boardRe_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return boardRe_list;
	}

	public int deleteOneboard(int num) {
		try {
			conn();
			String sql = "DELETE FROM board_num WHERE comments_number = ?";

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

	// 게시물번호에 맞는 댓글정보를 반환하는 메소드
	public ArrayList<boardReDTO> boardRe_li(int inputBoardNum) {
		ArrayList<boardReDTO> boardRe_list = new ArrayList<boardReDTO>();
		try {
			conn();
			String sql = "SELECT * FROM board_num where board_num =? ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, inputBoardNum);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int commentsNumber = rs.getInt(1);
				int boardNum = rs.getInt(2);
				String memberId = rs.getString(3);
				String commentsPw = rs.getString(4);
				String commentsContents = rs.getString(5);
				String commentsDate = rs.getString(6);

				boardReDTO dto = new boardReDTO(commentsNumber, boardNum, memberId, commentsPw, commentsContents,
						commentsDate);
				boardRe_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return boardRe_list;

	}
}