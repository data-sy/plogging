package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Model.noticeJoinDTO;

public class noticejoinDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardDTO dto = null;

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

	// 참가 메소드
	public int upload(noticeJoinDTO dto) {
		try {
			conn();
			String sql = "insert into notice_member(notice_number,member_id) "
					+ "values((select notice_number from notice where notice_number = ?) ,"
					+ "(select member_id from member where member_id = ?))";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getNotice_number());
			psmt.setString(2, dto.getMember_id());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 제한 인원 +1 하는 메소드
	public int upMember(int noticeNumber) {
		try {
			conn();
			String sql = "update notice set limited_number = (select limited_number+1 from notice where notice_number = ?) where notice_number = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, noticeNumber);
			psmt.setInt(2, noticeNumber);

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 참가 시 10 포인트를 주는 메소드
	public int upPoint(String id) {
		try {
			conn();
			String sql = "update member set point = (select point+10 from member where member_id = ?) where member_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, id);

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
