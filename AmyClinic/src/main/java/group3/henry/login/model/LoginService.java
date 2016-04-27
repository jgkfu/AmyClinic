package group3.henry.login.model;

import org.hibernate.*;

import hibernate.util.HibernateUtil;

import java.sql.SQLException;
import java.util.*;

import javax.naming.NamingException;

public class LoginService implements LoginService_Interface {

	private static final String GET_ALL_STMT = "from MemberVO order by mid";

	static private List<MemberVO> memberList = new ArrayList<MemberVO>();	

	public LoginService() {
		if (memberList.isEmpty()) {
			memberList = this.getAll(); 
		}
	}
	
	public MemberVO validate(String id, String pw) {			
		for (MemberVO mb : memberList) {
			if (mb.getName().trim().equals(id.trim()) && mb.getPwd().trim().equals(pw.trim()) ) {
				return mb;
//				String encrypedString = GlobalService.encryptString(password.trim());
//				String pswd = GlobalService.getMD5Endocing(encrypedString);
//				String mbpswd = mb.getPassword().trim();
//				if (mbpswd.equals(pswd)) {
//					return mb;
//				}
			}
		}
		return null;
	}
	
	
	@Override
	public List<MemberVO> getMemberList() { return memberList;};
	
	@Override
	public void addNewMember(MemberVO memberVO){memberList.add(memberVO);};
	
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public static void main(String[] args) throws NamingException, SQLException {

		LoginService dao = new LoginService();
		
		List<MemberVO> list = dao.getAll();
		for (MemberVO aMem : list) {
			System.out.print(aMem.getName() + ",");
			System.out.print(aMem.getPwd());

			System.out.println();
		}
	}
}
