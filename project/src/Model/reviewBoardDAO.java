package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class reviewBoardDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	//
	int cnt = 0;
	int cnt2 = 0;
	reviewBoardDTO dto = null;
	
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
	public int reviewCheck(int number ,String id) {
		try {
			conn();
			
			String sql = "update notice_member set review_check = 1 where notice_number =? and member_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, number);
			psmt.setString(2, id);
			
			cnt2 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt2;
	}
	// 이미지 업로드 메소드
			public int upload(reviewBoardDTO dto) {
				try {
					conn();
					
					String sql = "insert into review_board values(num_review_board.nextval\r\n" + 
								",(select member_id from member where member_id = ?),\r\n" + 
								"sysdate,?,?,?,?,?,?,?)";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, dto.getMemberId());
					psmt.setString(2, dto.getImg());
					psmt.setDouble(3, dto. getLat());
					psmt.setDouble(4, dto. getLng());
					psmt.setString(5, dto.getContents());
					psmt.setString(6, dto.getTitle());
					psmt.setString(7, dto.getTrash());
					psmt.setString(8, dto.getRun());
					
					cnt = psmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close();
				}return cnt;
			}
			

			// 전체게시글 보여주기 메소드
			public ArrayList<reviewBoardDTO> showBoard() {
				ArrayList<reviewBoardDTO> reviewBoard_list = new ArrayList<reviewBoardDTO>();
				try {
					conn();
					String sql = "select * from review_board order by review_date desc";
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						int reviewNumber = rs.getInt("review_number");
						String reviewTitle = rs.getString("review_title");
						double lat = rs.getDouble("lat");
						double lng = rs.getDouble("lng");
						String memberid = rs.getString("member_id");
						reviewBoardDTO dto = new reviewBoardDTO(reviewNumber,reviewTitle,lat,lng ,memberid);
						reviewBoard_list.add(dto);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close();
				}
				return reviewBoard_list;
				
			}

			
			// 개별 게시글 보여주기 메소드
			   public reviewBoardDTO showOne(int reviewNumber) {
			      try {
			         conn();
			         String sql ="select * from review_board where review_number = ?";
			         
			         psmt = conn.prepareStatement(sql);
			         psmt.setInt(1, reviewNumber);
			         rs = psmt.executeQuery();
			         
			         if(rs.next()) {
							String memberId = rs.getString("member_id");
							String review_date = rs.getString("review_date");
							String review_image = rs.getString("review_image");
							double lat = rs.getDouble("lat");
							double lng = rs.getDouble("lng");
							String contents = rs.getString("contents");
							String review_title = rs.getString("review_title");
							String trash = rs.getString("trash");
							String run = rs.getString("run");
			            
			            
							dto = new reviewBoardDTO( memberId, review_date,review_image, lat,lng
									,contents,review_title,trash,run);
			         }
			      } catch (SQLException e) {
			         e.printStackTrace();
			      } finally {
			         close();
			      } return dto;
			   }
			   public ArrayList<reviewBoardDTO> showBoard1(String id) {
	               ArrayList<reviewBoardDTO> reviewBoard_list = new ArrayList<reviewBoardDTO>();
	               try {
	                  conn();
	                  String sql = "select * from review_board  WHERE member_id = ? order by review_date desc";
	                  psmt = conn.prepareStatement(sql);
	                   psmt.setString(1, id);
	                  rs = psmt.executeQuery();

	                  while(rs.next()) {
	                     int review_number = rs.getInt(1);
	                     String memberId = rs.getString(2);
	                     String review_date = rs.getString(3);
	                     String review_image = rs.getString(4);
	                     double lat = rs.getDouble(5);
	                     double lng = rs.getDouble(6);
	                     String contents = rs.getString(7);
	                     String review_title = rs.getString(8);
	                     String trash = rs.getString(9);
	                     String run = rs.getString(10);
	                     
	                     reviewBoardDTO dto = new reviewBoardDTO( review_number,memberId, review_date,review_image, lat,lng
	                           ,contents,review_title,trash,run);
	                     reviewBoard_list.add(dto);
	                  }
	                  
	               } catch (SQLException e) {
	                  e.printStackTrace();
	               }finally {
	                  close();
	               }
	               return reviewBoard_list;
	               
	            }
			   public int deleteOnereview(int num) {
				      try {
				         conn();
				         String sql = "DELETE FROM review_board WHERE review_number = ?";
				         
				         psmt = conn.prepareStatement(sql);
				         
				         psmt.setInt(1, num);
				         
				         cnt = psmt.executeUpdate();
				         
				      } catch (SQLException e) {
				         e.printStackTrace();
				      } finally {
				         close();
				      } return cnt;      
				   }
}
