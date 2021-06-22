package ksk0525;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DAO2 {
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
		String sql = "SELECT COUNT(regdate) count FROM uploadfiles";
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
	
	public ArrayList<DTO2> getListUser(int p, int numOfRecords) throws SQLException {
		
		ArrayList<DTO2>dtos = new ArrayList<DTO2>();
		Connection con = getConnection();
		String sql = "select * from (select rownum num, L.* from (select * from uploadfiles order by regdate) L)" + 
				" where num between ? and ?";   // from과 (select 사이, where 앞에 빈칸 잇어야됨
		
		//생성된 연결을 통해 SQL문 실행 의뢰 준비	//0507
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, 1+(p-1)*numOfRecords);
		st.setInt(2, p*numOfRecords);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			DTO2 dto2 = new DTO2(rs.getString("userID"),rs.getString("title"),rs.getString("fileName"),rs.getString("Content"),rs.getString("regdate"));
			dtos.add(dto2);
		}
		
		rs.close();
		st.close();
		con.close();
		return dtos;
	}
}
