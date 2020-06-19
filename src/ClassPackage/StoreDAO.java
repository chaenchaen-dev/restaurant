package ClassPackage;

import java.sql.Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StoreDAO {

	
	private final String server = "localhost:3306"; // MySQL 서버 주소
	private final String database = "restaurant"; // MySQL DATABASE 이름
	private final String user_name = "root"; // MySQL 서버 아이디
	private final String password = "1234"; // MySQL 서버 비밀번호
	
	
	private int STORE_NO;
	private String  STORE_ADDRESS;
	private String STORE_TEL;
	private int TABLE_COUNTS;
	private String OPEN_TIME,CLOSE_TIME;
	
	
	public StoreDAO() {
		
	}
	
	Connection con = null;
	
	private Connection connection() {
		// 1.드라이버 로딩
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println(" !! <JDBC 오류> Driver load 오류: " + e.getMessage());
			e.printStackTrace();
		}
		// 2.연결
		try {
			con = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?serverTimezone=UTC&useSSL=false", user_name,
					password);
			System.out.println("정상적으로 연결되었습니다.");
		} catch (SQLException e) {
			System.err.println("con 오류:" + e.getMessage());
			e.printStackTrace();
		}

		return con;
	} //connection()
	
	// 전체 매장 목록 반환
		public ArrayList<String[]> getStoreList() {
			ArrayList<String[]> result = new ArrayList<>();
			PreparedStatement pstmt = null;
			try {
				String SQL = "select store_no, store_address, store_tel, table_counts, date_format(open_time, '%H:%i') OPEN_TIME ,date_format(close_time, '%H:%i') CLOSE_TIME from store";

				con = connection();
				pstmt = con.prepareStatement(SQL);

				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					String store_no = rs.getString("STORE_NO");
					String store_add = rs.getString("STORE_ADDRESS");
					String store_tel = rs.getString("STORE_TEL");
					String table_cnt = rs.getString("TABLE_COUNTS");
					String open_time = rs.getString("OPEN_TIME");
					String close_time = rs.getString("CLOSE_TIME");
					String[] storeInfos = { store_no,store_add, store_tel, table_cnt, open_time, close_time };
					result.add(storeInfos);
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return result;
		}

	
}
