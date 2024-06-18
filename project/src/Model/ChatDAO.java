package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
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

	public int insertChat(int chatroom_number, String member_id, String content) {
		try {
			conn();

			String sql = "insert into chat values(num_chat.nextval,?,?,?,sysdate)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, chatroom_number);
			psmt.setString(2, member_id);
			psmt.setString(3, content);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// ä�ù��ȣ�� �´� ä�ó������� ����Ʈ�� ��ȯ�ϴ� �޼ҵ�
	public ArrayList<ChatDTO> selectAllChat(String inputRoom_number) {
		ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
		try {
			conn();

			// ä�ù� ��ȣ�� �´� �����͸� �ֽż�����
			String sql = "select * from chat where chatroom_number = ? order by day";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, inputRoom_number);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int chat_number = rs.getInt(1);
				int chatroom_number = rs.getInt(2);
				String member_id = rs.getString(3);
				String content = rs.getString(4);
				String day = rs.getString(5);
				ChatDTO dto = new ChatDTO(chat_number, chatroom_number, member_id, content, day);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}