package ksk0525;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class DAO {
	// DB 연동 커넥션 얻기
		private Connection getConnection() {
			//연결 정보와 SQL
			String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
			String user = "KSK";
			String passwd = "1111";
			
			Connection con = null;
			
			//1. DB 연동 드라이버 로드
			try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, passwd);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			//2. 연결 객체 생성
			return con;
		}
		
		public int getCount() throws SQLException {
			int count = 0;
			String sql = "SELECT COUNT(regdate) count FROM list";
			Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			if(rs.next()) {
				count =rs.getInt("count"); 
			}
			rs.close();
			st.close();
			con.close();
			return count;			
		}
		//DB에서 레코드를 numOfRecord 만큼 가져온다   // 0527
		
		public ArrayList<DTO> getListUser(int p, int numOfRecords) throws SQLException {
			
			ArrayList<DTO>dtos = new ArrayList<DTO>();
			Connection con = getConnection();
			String sql = "select * from (select rownum num, L.* from (select * from List order by regdate) L)" + 
					" where num between ? and ?";   // from과 (select 사이, where 앞에 빈칸 잇어야됨
			
			//생성된 연결을 통해 SQL문 실행 의뢰 준비	//0507
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, 1+(p-1)*numOfRecords);
			st.setInt(2, p*numOfRecords);
			
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				
				DTO dto = new DTO(rs.getString("title"),rs.getString("userID"),rs.getString("regdate"),rs.getString("Content"));
				dtos.add(dto);
			}
			
			rs.close();
			st.close();
			con.close();
			return dtos;
		}
		
		//private Connection con; //자바와 데이터베이스를 연결
		//private PreparedStatement pstmt; //쿼리문 대기 및 설정
		//private ResultSet rs; //결과값 받아오기
		
		public int login(String userID, String pwd) {
		    Connection con =null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String dbpwd = "" ;
		    int check = 0;
			
			try {
				con = getConnection();
				String sql = "SELECT userid,pwd from USERS WHERE userID=?";
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, userID); 
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dbpwd = rs.getString("PWD");
					if(dbpwd.equals(pwd)) {
						check = 1;
						System.out.println(dbpwd); //로그인 성공
					}else {
						check = 0;
					System.out.println("2");
					System.out.println(dbpwd);//비밀번호 틀림
					}
				}else {
					check = -1;
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null) con.close();
				}catch(Exception e ) {
					e.printStackTrace();
				}
			}
			return check;
			
		}
		
}



