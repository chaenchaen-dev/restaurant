package ClassPackage;
//레스토랑!!!!!!!!!!!!!!!!!!!!!!!!!!
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	private final String server = "localhost:3306"; // MySQL 서버 주소
	private final String database = "restaurant"; // MySQL DATABASE 이름
	private final String user_name = "root"; // MySQL 서버 아이디
	private final String password = "1234"; // MySQL 서버 비밀번호
	
	
	private int MEMBER_NO;
	private String MEMBER_NAME;
	private String ADDRESS;
	private String TEL;
	private String BIRTHDAY;
	private String HOBBY;
	private int PREFERENCE_STORE_NO;
	private String grade;
	private int POINT;
	private int NO_SHOW_COUNTS;
	private String ID;
	private String PWD;
	
	
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
		public boolean insertMember( String member_name, String member_address, String member_tel, String birthday, String hobby, int preference_store_no, String id, String pwd) {
			PreparedStatement pstmt = null;
			try {
				
				System.out.println("dfafdsafsdfsafd");
				String SQL = "insert into restaurant.member( member_name, member_address, member_tel, birthday, hobby, preference_store_no, grade, point, no_show_counts, id, pwd) values (?,?,?,?,?,?,'일반',1000,0,?,?);";

				con = connection();
				pstmt = con.prepareStatement(SQL);
				// 매개변수의 값을 넣음
//				pstmt.setInt(1, member_no);
				pstmt.setString(1, member_name);
				pstmt.setString(2, member_address);
				pstmt.setString(3, member_tel);
				pstmt.setString(4, birthday);
				pstmt.setString(5, hobby);
				pstmt.setInt(6, preference_store_no);
//				pstmt.setString(7, "일반");
//				pstmt.setInt(8, 1000);
//				pstmt.setInt(9, 0);
				pstmt.setString(7, id);
				pstmt.setString(8, pwd);
				
				

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

		// 사용자 인증 (아이디랑 비밀번호 일치 여부 확인)
		public boolean certifyMember(String id, String pwd) throws SQLException {
			PreparedStatement pstmt = null;

			String SQL = "select * from restaurant.member where id=? and pwd=?";

			con = connection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			ResultSet rs = pstmt.executeQuery();
			rs.last();
			int cnt = rs.getRow();

			rs.close();
			pstmt.close();
			con.close();

			if (cnt != 0)
				return true;
			else
				return false;
		}

		public int getMEMBER_NO() {
			return MEMBER_NO;
		}

		public void setMEMBER_NO(int mEMBER_NO) {
			MEMBER_NO = mEMBER_NO;
		}

		public String getMEMBER_NAME() {
			return MEMBER_NAME;
		}

		public void setMEMBER_NAME(String mEMBER_NAME) {
			MEMBER_NAME = mEMBER_NAME;
		}

		public String getADDRESS() {
			return ADDRESS;
		}

		public void setADDRESS(String aDDRESS) {
			ADDRESS = aDDRESS;
		}

		public String getTEL() {
			return TEL;
		}

		public void setTEL(String tEL) {
			TEL = tEL;
		}

		public String getBIRTHDAY() {
			return BIRTHDAY;
		}

		public void setBIRTHDAY(String bIRTHDAY) {
			BIRTHDAY = bIRTHDAY;
		}

		public String getHOBBY() {
			return HOBBY;
		}

		public void setHOBBY(String hOBBY) {
			HOBBY = hOBBY;
		}

		public int getPREFERENCE_STORE_NO() {
			return PREFERENCE_STORE_NO;
		}

		public void setPREFERENCE_STORE_NO(int pREFERENCE_STORE_NO) {
			PREFERENCE_STORE_NO = pREFERENCE_STORE_NO;
		}

		public String getGrade() {
			return grade;
		}

		public void setGrade(String grade) {
			this.grade = grade;
		}

		public int getPOINT() {
			return POINT;
		}

		public void setPOINT(int pOINT) {
			POINT = pOINT;
		}

		public int getNO_SHOW_COUNTS() {
			return NO_SHOW_COUNTS;
		}

		public void setNO_SHOW_COUNTS(int nO_SHOW_COUNTS) {
			NO_SHOW_COUNTS = nO_SHOW_COUNTS;
		}

		public String getID() {
			return ID;
		}

		public void setID(String iD) {
			ID = iD;
		}

		public String getPWD() {
			return PWD;
		}

		public void setPWD(String pWD) {
			PWD = pWD;
		}
	
	
	
}
