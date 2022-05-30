
package homework;

import javax.servlet.ServletContext;

import common.JDBConnect;
public class MembershipDAO extends JDBConnect{ 
	public MembershipDAO (ServletContext application) {
		super(application); 
	}
	
	
	
	
	public int memberInsert(MembershipDTO dto) {
		int rs=0;
		String query = 
			"INSERT INTO membership (id, pass, name, gender, birth, zip, addr, email, mobile, tel) "
			+ " VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getGender());
			psmt.setString(5, dto.getBirth());
			psmt.setString(6, dto.getZip());
			psmt.setString(7, dto.getAddr());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getMobile());
			psmt.setString(10, dto.getTel());
			rs= psmt.executeUpdate();
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	} 
	
	
	
	
	
}

