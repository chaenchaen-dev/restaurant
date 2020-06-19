package ClassPackage;
import java.sql.Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
public class ReserveDAO {

	private final String server = "localhost:3306"; // MySQL 서버 주소
	private final String database = "restaurant"; // MySQL DATABASE 이름
	private final String user_name = "root"; // MySQL 서버 아이디
	private final String password = "1234"; // MySQL 서버 비밀번호
	
	
	private int RESERVE_NO;
	private String RESERVE_TIME;
	private String RESERVE_NUMBER_OF_PERSONS;
	private int MEMBER_NO;
	private int STORE_NO;
	
	
	Connection con = null;
	
	public ReserveDAO() {}
	
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

//얘 고쳐야함!!!!!!!!!
	public boolean reserve(int memnum, int store_no, String date, String time, int person) {
		PreparedStatement pstmt = null;
		boolean result = false;
		String date_time;
		date_time = date + " " + time;
		try {
			
			String sql = "insert into restaurant.reservation(reserve_time, reserve_number_of_persons, member_member_no, store_store_no) values(?,?,?,?)";

			con = connection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date_time);
			pstmt.setInt(2, person);
			pstmt.setInt(3, memnum);
			pstmt.setInt(4, store_no);
			
			
			pstmt.executeUpdate();

			pstmt.close();
			con.close();


			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	} //reserve end
	
	public ArrayList searchReserveByMember_no(int member_no) {
		ArrayList<String[]> result = new ArrayList<>();
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT store_store_no,reserve_time, reserve_number_of_persons FROM restaurant.reservation WHERE member_member_no=?";

			con = connection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_no);

			ResultSet rs = pstmt.executeQuery();// SQL문에 대한 결과값
			while (rs.next()) {
				String reserve_time = rs.getString("reserve_time");
				String store_no = rs.getString("store_store_no");
				String reservenum = rs.getString("reserve_number_of_persons");
				String[] reserveInfo = {store_no,reserve_time,reservenum};
				result.add(reserveInfo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private String getReserveAvailable(String member_no) {
		PreparedStatement pstmt = null;
		String result = "";
		try {
			String SQL = "select * from rental where bookid=? and returnrequest<>2";

			con = connection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, member_no);

			ResultSet rs = pstmt.executeQuery();
			rs.last();
			int cnt = rs.getRow();
			if (cnt != 0)
				result = "false";
			else
				result = "true";

			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 예약 취소
	public boolean deleteReservation(int member_no, int store_no) {
		PreparedStatement pstmt = null;
		try {
			String SQL = "delete from reservation where STORE_STORE_NO=? and MEMBER_MEMBER_NO=?";

			con = connection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, store_no);
			pstmt.setInt(2, member_no);
			pstmt.executeUpdate();

			pstmt.close();
			con.close();


			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}


}//end
