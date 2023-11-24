package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import entity.User;
import entity.Video;
import utils.JpaUtil;

public class UserDAO {
	private static EntityManager em = JpaUtil.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public static void main(String[] args) {
//		List<User>list=findAll();
//		System.out.println(list);
	}

	public User create(User entity) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			em.persist(entity);// Chấp nhận kết quả thao tác
			em.getTransaction().commit();
			System.out.println("Them moi thanh cong!");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Them moi that bai!");
			e.printStackTrace();
			return null;
		}
		
	}

	public User findByID(String username) {
		EntityManager em = JpaUtil.getEntityManager();
	    String jpql = "SELECT a FROM User a WHERE a.id=:id";
	    TypedQuery<User> query = em.createQuery(jpql, User.class);
	    query.setParameter("id", username);
	    
	    try {
	      User v = query.getSingleResult();
	        return v;
	    } catch (Exception e) {
	        return null; // Return null when no Video is found
	    }
	}
	public User findByEmail(String username) {
		String jpql = "SELECT a FROM User a WHERE a.email=:id";
	    TypedQuery<User> query = em.createQuery(jpql, User.class);
	    query.setParameter("id", username);
	    try {
	        User user = query.getSingleResult();
	        return user;
	    } catch (Exception e) {
	        return null; // Return null when no user is found
	    }
	}
	
	  public  List<User> selectAll(){
		  String jpql = "SELECT a FROM User a";
		    TypedQuery<User> query = em.createQuery(jpql, User.class);
		    try {
		        List<User> user = query.getResultList();
		        return user;
		    } catch (Exception e) {
		        return null; // Return null when no user is found
		    }
		}
	public User delete(String username) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			User user = em.find(User.class, username);
			em.remove(user);
			em.getTransaction().commit();
			System.out.println("Xoa thanh cong!");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Xoa that bai!");
			e.printStackTrace();
		}
	return null;
	}

	public User update(User entity) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			User user = em.find(User.class,entity.getId());
			user.setAdmin(true);
			user.setEmail(entity.getEmail());
			user.setFullname(entity.getFullname());
			user.setPassword(entity.getPassword());
			em.merge(user);
			em.getTransaction().commit();
			System.out.println("Cap nhat thanh cong!");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Cap nhat that bai!");
			e.printStackTrace();
			return null;
		}
		
	}
	public User findOne(String username, String password) {
	    String jpql = "SELECT a FROM User a WHERE a.id=:id AND a.password=:pw";
	    TypedQuery<User> query = em.createQuery(jpql, User.class);
	    query.setParameter("id", username);
	    query.setParameter("pw", password);
	    try {
	        User user = query.getSingleResult();
	        return user;
	    } catch (Exception e) {
	        return null; // Return null when no user is found
	    }
	}
	public List<User> findPage(int page, int size) {
	
		String jpql = "SELECT o FROM User o";
		// Tạo đối tượng truy vấn
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setFirstResult(page * size);
		query.setMaxResults(size);
		// Truy vấn
		List<User> list = query.getResultList();
		// Hiển thị kết quả truy vấn
	
		return list;
	}
	
	public int getTotalRecords() {
	    int totalRecords = 0;

	    try {
	        String jpql = "SELECT COUNT(o) FROM User o"; // Đếm tổng số bản ghi
	        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
	        
	        Long result = query.getSingleResult(); // Lấy kết quả đếm

	        totalRecords = result.intValue(); // Chuyển kết quả thành int
	    } catch (Exception e) {
	        // Xử lý ngoại lệ khi không có kết quả
	        e.printStackTrace();
	    }

	    return totalRecords;
	}

}
