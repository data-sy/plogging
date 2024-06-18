package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.memberDTO;

import Model.memberDTO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	memberDTO info = null;

	int cnt = 0;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
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

	// ȸ������ �޼ҵ�
	public int join(memberDTO dto) {
		try {
			// DB ���� �޼ҵ� ȣ��
			conn();

			String sql = "insert into member values(?,?,?,?,?,?,?,0,0)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getMemberPw());
			psmt.setString(3, dto.getMemberName());
			psmt.setInt(4, dto.getMemberAge());
			psmt.setDouble(5, dto.getMemberLat());
			psmt.setDouble(6, dto.getMemberLng());
			psmt.setString(7, dto.getMemberPlogOwn());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB �� �ݴ� �޼ҵ� ȣ��
			close();
		}
		return cnt;
	}

	// �α��� �޼ҵ�
	public memberDTO login(String getMemberId, String getMemberPw) {
		try {
			conn();
			String sql = "select * from member where member_id = ? and member_pw = ? ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, getMemberId);
			psmt.setString(2, getMemberPw);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String memberId = rs.getString(1);
				String memberPw = rs.getString(2);
				String memberName = rs.getString(3);
				int memberAge = rs.getInt(4);
				double memberLat = rs.getDouble(5);
				double memberLng = rs.getDouble(6);
				String memberPlogOwn = rs.getString(7);
				int memberPlogCount = rs.getInt(8);

				info = new memberDTO(memberId, memberPw, memberName, memberAge, memberLat, memberLng, memberPlogOwn,
						memberPlogCount);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;

	}

	// ȸ���������� �޼ҵ�
	public int update(memberDTO dto) {
		try {
			conn();
			String sql = "update member set member_pw=?, member_name=?, member_age=? where member_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMemberPw());
			psmt.setString(2, dto.getMemberName());
			psmt.setInt(3, dto.getMemberAge());
			psmt.setString(4, dto.getMemberId());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

//   public ArrayList<memberDTO> showMember() {
//      ArrayList<memberDTO> list = new ArrayList<memberDTO>();
//      try {
//         conn();
//         String sql = "select * from member";
//         psmt = conn.prepareStatement(sql);
//         rs = psmt.executeQuery();
//         
//         while(rs.next()) {
//            String memberId = rs.getString("id");
//            String memberPw = rs.getString("pass");
//            String memberName = rs.getString("name");
//            int memberAge = rs.getInt("age");
//            // �ּҴ� lat�� lng�� �ٲ� ���߿� ����� ���� �� �����ϱ�
//            String memberAddr = rs.getString("address");
//            String memberPlogCount = rs.getString("exp");
//            
//            memberDTO dto = new memberDTO(memberId, memberPw, memberName, memberAge, memberAddr,memberPlogCount);
//            list.add(dto);         
//         }
//         
//      } catch (SQLException e) {
//         e.printStackTrace();
//      } finally {
//         close();
//      } return list;      
//   }

	public int checkId(String id) {

		int result = -1;

		try {
			conn();
			String sql = "select member_id from member where member_id =?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				result = 0;
			} else {
				result = 1;
			}
			System.out.println("���̵� �ߺ�üũ��� : " + result);
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close();
		}

		return result;

	}

	public String showPoint(String id) {
		String point = "sql������";
		try {
			conn();
			String sql = "select * from member where member_id = ? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				point = rs.getString("point");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return point;
	}

}