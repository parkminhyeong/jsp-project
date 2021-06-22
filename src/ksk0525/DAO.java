package ksk0525;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class DAO {
	// DB ���� Ŀ�ؼ� ���
		private Connection getConnection() {
			//���� ������ SQL
			String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
			String user = "KSK";
			String passwd = "1111";
			
			Connection con = null;
			
			//1. DB ���� ����̹� �ε�
			try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, passwd);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			//2. ���� ��ü ����
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
		//DB���� ���ڵ带 numOfRecord ��ŭ �����´�   // 0527
		
		public ArrayList<DTO> getListUser(int p, int numOfRecords) throws SQLException {
			
			ArrayList<DTO>dtos = new ArrayList<DTO>();
			Connection con = getConnection();
			String sql = "select * from (select rownum num, L.* from (select * from List order by regdate) L)" + 
					" where num between ? and ?";   // from�� (select ����, where �տ� ��ĭ �վ�ߵ�
			
			//������ ������ ���� SQL�� ���� �Ƿ� �غ�	//0507
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
		
		//private Connection con; //�ڹٿ� �����ͺ��̽��� ����
		//private PreparedStatement pstmt; //������ ��� �� ����
		//private ResultSet rs; //����� �޾ƿ���
		
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
						System.out.println(dbpwd); //�α��� ����
					}else {
						check = 0;
					System.out.println("2");
					System.out.println(dbpwd);//��й�ȣ Ʋ��
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



