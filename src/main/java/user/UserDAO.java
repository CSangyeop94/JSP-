// DAO-데이터 베이스 접근 객체
// JSP에서 회원 데이터베이스 테이블에 접근할수있도록 DAO를만들어줌
// 실질적으로 데이터 베이스에서 회원 정보를 불러오거나 
// 데이터베이스의 회원정보를 넣을떄 사용
// 로그인 기능 구현

package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
		
	private Connection conn; // 데이터베에스의 접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;
	//컨트롤+쉬프트 o로 sql에 연결시켜줌
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3308/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.d-Drvier"); //mysql에 접속할수있게 도와주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace(); // 오류가 발생하면 printStackTrace를 사용해서 오류 출력
		}
	}
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //PreparedStatement에 정해진 sql 문장을 데이터베이스에 삽입합는 형식
			pstmt.setString(1, userID);  
			rs = pstmt.executeQuery(); //결과를 담을수있는 객체에 실행한 결과를 삽입
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디가없음
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return -2; //데이터베이스 오류
		
		
		
	}
	public int join(User user ) {
		String SQL = "INSERT IN TO USER VALUES (?, ?, ?, ?, ?)";
				try{
					pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, user.getUserID());
					pstmt.setString(2, user.getUserPassword());
					pstmt.setString(3, user.getUserName());
					pstmt.setString(4, user.getUserGender());
					pstmt.setString(5, user.getUserEmail());
				} catch(Exception e) {
					e.printStackTrace();
				}
				return -1; //데이터 베이스 오류
		}
}
