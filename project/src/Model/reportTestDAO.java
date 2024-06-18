package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class reportTestDAO {
	Connection conn = null;
	int cnt = 0;
	int num = 0;
	PreparedStatement psmt = null;
	ResultSet rs = null;

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
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ������ �������̺� ���ε� �ϴ� �޼ҵ�
	public int reportUpload(reportTestDTO dto) {
		try {
			conn();
			String sql = "insert into tip_off values(num_tip_off.nextval, sysdate, ?,?,?,?,0)";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, dto.getLat());
			psmt.setString(2, dto.getImg());
			psmt.setDouble(3, dto.getLng());
			psmt.setString(4, dto.getAddr());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	// ��� ��밡���� (notice_check=0) �������� ��̸���Ʈ�� ��ȯ�ϴ� �޼ҵ�
	public ArrayList<reportTestDTO> reportShow() {
		ArrayList<reportTestDTO> array = new ArrayList<reportTestDTO>();
		try {
			conn();

			String sql = "select * from tip_off WHERE notice_check=0 ";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int report_number = rs.getInt(1);
				String report_date = rs.getString(2);
				double lat = rs.getDouble(3);
				String img = rs.getString(4);
				double lng = rs.getDouble(5);
				String addr = rs.getString(6);
				int notice_check = rs.getInt(7);

				reportTestDTO dto = new reportTestDTO(report_number, report_date, lat, img, lng, addr, notice_check);
				array.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return array;
	}
	
	// ������ ����� ������ִ� �޼ҵ�
	public int makeNotice(reportTestDTO dto) {
		try {
			conn();

			String sql = "INSERT INTO notice VALUES(num_notice.nextval, ?, sysdate, 0, SYSDATE+7, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getReport_number());
			psmt.setString(2, dto.getImg());
			psmt.setString(3, dto.getAddr());
			psmt.setDouble(4, dto.getLat());
			psmt.setDouble(5, dto.getLng());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// ���� ��ȣ�� �´� �������� ��̸���Ʈ�� ��ȯ�ϴ� �޼ҵ�
	public ArrayList<reportTestDTO> showReportForNotice(int inputNoticeNumber) {
		ArrayList<reportTestDTO> array2 = new ArrayList<reportTestDTO>();
		try {
			conn();

			String sql = "select * from tip_off WHERE notice_check=? ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, inputNoticeNumber);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int report_number = rs.getInt(1);
				String report_date = rs.getString(2);
				double lat = rs.getDouble(3);
				String img = rs.getString(4);
				double lng = rs.getDouble(5);
				String addr = rs.getString(6);
				int notice_check = rs.getInt(7);

				reportTestDTO dto = new reportTestDTO(report_number, report_date, lat, img, lng, addr, notice_check);
				array2.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return array2;
	}
	
	
	// noticeCheck�� 1�� �������ִ� �޼ҵ� (�����ڵ�ȭ�� ���� �������� 1 ó���ؼ� ���)
	// -> 1�� �ƴ϶� �����ȣ�� ���� (��ǻ� �����ȣ ����Ű �÷��̶� �����ϸ� ��)
	public int noticeCheck(int num, reportTestDTO dto) {
		try {
			conn();
			String sql = "UPDATE tip_off SET notice_check = ? WHERE report_number = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.setInt(2, dto.getReport_number());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// ������ �����ϴ� �޼ҵ�
	   public int deleteReport(int report_number) {
	      try {
	         conn();
	         String sql = "DELETE FROM tip_off WHERE report_number = ?";

	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, report_number);

	         cnt = psmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return cnt;
	      
	   }
}