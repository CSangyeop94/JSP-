// DAO-������ ���̽� ���� ��ü
// JSP���� ȸ�� �����ͺ��̽� ���̺� �����Ҽ��ֵ��� DAO���������
// ���������� ������ ���̽����� ȸ�� ������ �ҷ����ų� 
// �����ͺ��̽��� ȸ�������� ������ ���
// �α��� ��� ����

package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
		
	private Connection conn; // �����ͺ������� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;
	private ResultSet rs;
	//��Ʈ��+����Ʈ o�� sql�� ���������
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3308/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.d-Drvier"); //mysql�� �����Ҽ��ְ� �����ִ� ���̺귯��
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace(); // ������ �߻��ϸ� printStackTrace�� ����ؼ� ���� ���
		}
	}
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //PreparedStatement�� ������ sql ������ �����ͺ��̽��� �����մ� ����
			pstmt.setString(1, userID);  
			rs = pstmt.executeQuery(); //����� �������ִ� ��ü�� ������ ����� ����
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; // �α��� ����
				else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; //���̵𰡾���
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return -2; //�����ͺ��̽� ����
		
		
		
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
				return -1; //������ ���̽� ����
		}
}
