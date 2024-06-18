package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class notice_BoardDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	notice_BoardDTO dto = null;
	notice_BoardDTO noticelist2 = null;

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

	// 공고 참여자 목록테이블에 삽입 (notice_member) 백업해두고 지움
	// 사용자 주소 중심 매칭 기능 사라져서 백업해두고 지움

	// 공고번호에 따른 공고 정보
	public notice_BoardDTO showNoticeInfo(int inputNoticeNumber) {
		try {
			conn();

			String sql = "select * from notice where notice_number = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, inputNoticeNumber);
			rs = psmt.executeQuery();
			if (rs.next()) {
				int noticeNumber = rs.getInt("notice_number");
				int tip_off_number = rs.getInt("tip_off_number");
				String noticeDate = rs.getString("notice_date");
				String limitedNumber = rs.getString("limited_number");
				String plogDate = rs.getString("plog_date");
				String noticeImage = rs.getString("notice_image");
				String addr = rs.getString("address");
				double lat = rs.getDouble("lat");
				double lng = rs.getDouble("lng");

				dto = new notice_BoardDTO(noticeNumber, tip_off_number, noticeDate, limitedNumber, plogDate,
						noticeImage, addr, lat, lng);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	//
	public ArrayList<notice_BoardDTO> showOne(String id) {
		ArrayList<notice_BoardDTO> noticelist = new ArrayList<notice_BoardDTO>();
		try {
			conn();

			String sql = "select notice_number ,address ,lat,lng from notice \r\n"
					+ "where notice_number in(select notice_number \r\n"
					+ "                     from notice_member \r\n"
					+ "                     where member_id in(?) and review_check is null) order by plog_date desc";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int notice_number = rs.getInt("notice_number");
				String addr = rs.getNString("address");
				double lat = rs.getDouble("lat");
				double lng = rs.getDouble("lng");
				notice_BoardDTO noticelist2 = new notice_BoardDTO(notice_number, addr, lat, lng);
				noticelist.add(noticelist2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return noticelist;
	}

	// 조회에서 공고 목록 보여주는 메소드 (조회 때 사용)
	public ArrayList<notice_BoardDTO> showBoard(String id) {
		ArrayList<notice_BoardDTO> notic_BoardDTO_list = new ArrayList<notice_BoardDTO>();
		try {
			conn();
			String sql = "select * from notice \r\n" + "where notice_number not in(select notice_number \r\n"
					+ "                     from notice_member \r\n" + "                     where member_id in(?)) "
					+ "and limited_number<30 " + "order by plog_date desc ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int noticeNumber = rs.getInt("notice_number");
				String noticeImage = rs.getString("notice_image");
				String limitedNumber = rs.getString("limited_number");
				String addr = rs.getNString("address");
				String plogDate = rs.getString("plog_date");

				notice_BoardDTO dto = new notice_BoardDTO(noticeNumber, limitedNumber, plogDate, noticeImage, addr);
				notic_BoardDTO_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return notic_BoardDTO_list;
	}

	// 채팅방 참가 목록 보여주는 메소드 (조회에서 '참가'버튼을 누른 공고들)
	public ArrayList<notice_BoardDTO> showMyChatroom(String inputId) {
		ArrayList<notice_BoardDTO> list = new ArrayList<notice_BoardDTO>();
		try {
			conn();
			String sql = "select distinct chatroom_number from chat where member_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, inputId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int notice_number = rs.getInt("chatroom_number");
				notice_BoardDTO dto = new notice_BoardDTO(notice_number);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 공고 신청 목록 보여주는 메소드 (채팅방에서 '신청'버튼을 누른 공고들)
	public ArrayList<notice_BoardDTO> showMyNotice(String inputId) {
		ArrayList<notice_BoardDTO> list = new ArrayList<notice_BoardDTO>();
		try {
			conn();

			String sql = "select * from notice_member where member_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, inputId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int notice_number = rs.getInt("notice_number");
				notice_BoardDTO dto = new notice_BoardDTO(notice_number);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 제보 번호에 따른 공고 번호 찾는 메소드
	public int report2notice(int report_number) {
		int notice_number = 0;
		try {
			conn();

			String sql = "select notice_number from notice where tip_off_number = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, report_number);
			rs = psmt.executeQuery();

			while (rs.next()) {
				notice_number = rs.getInt("notice_number");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return notice_number;
	}

	// 플로깅 날짜가 지나면 다시 +7일 뒤로 수정하는 메소드 -> 아직 실데이터로는 테스트 안 해봄
	public int plogDateUpdate() {
		try {
			conn();
			String sql = "UPDATE (SELECT plog_date FROM notice WHERE plog_date<sysdate) SET plog_date = plog_date+7";
			psmt = conn.prepareStatement(sql);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 공고의 위도, 경도 구하는 메소드
	public notice_BoardDTO lating(int num) {
		try {
			conn();

			String sql = "select lat, lng from notice where notice_number = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				double lat = rs.getDouble("lat");
				double lng = rs.getDouble("lng");
				
				dto = new notice_BoardDTO(lat, lng);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	// 공고의 플로깅 날짜만 추출하는 메소드 // 이건 나중에 디자인에 따라 원하는 형태로 바꿀 수 있게 하려고 메소드로 만듦. jsp안 건드리고
	// 이 메소드만 바꾸면 돼~
	public String changeDateFormat(String plogDate) {
		String year = plogDate.substring(0, 4);
		String month = plogDate.substring(5, 7);
		String day = plogDate.substring(8, 10);
		// 여기서 원하는 포맷으로 수정하면 돼
		String result = month + "." + day;
		return result;
	}

}
