package ClassPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO {

	private final String server = "localhost:3306"; // MySQL 서버 주소
	private final String database = "DATEBASE이름"; // MySQL DATABASE 이름
	private final String user_name = "root"; // MySQL 서버 아이디
	private final String password = "1234"; // MySQL 서버 비밀번호
	
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
	
	// 회원 가입
		public boolean insertMember(String id, String passwd, String name, String email, String phone, int type) {
			PreparedStatement pstmt = null;
			try {
				String SQL = "insert into db_library.member(id, passwd, name, email, phone, type) values(?, ?, ?, ?, ?, ?)";

				con = connection();
				pstmt = con.prepareStatement(SQL);
				// 매개변수의 값을 넣음
				pstmt.setString(1, id);
				pstmt.setString(2, passwd);
				pstmt.setString(3, name);
				//pstmt.setString(4, email);
				//pstmt.setString(5, phone);
				//pstmt.setInt(6, type);

				int edit = pstmt.executeUpdate(); // SQL문장 실행 및 결과 리턴
				System.out.println("변경된 row: " + edit); // 리턴값으로 변경된 row 확인 가능 , 선택사항이므로 생략 가능

				pstmt.close();
				con.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		} // insertMember() 

	
	
	
	
}
