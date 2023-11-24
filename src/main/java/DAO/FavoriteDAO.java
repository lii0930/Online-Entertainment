package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import entity.Favorite;
import entity.User;
import utils.JpaUtil;


public class FavoriteDAO {
  
//	public Favorite findOne(String username, String videoId) {
//		EntityManager em = JpaUtil.getEntityManager();
//	    String jpql = "SELECT a FROM Favorite a WHERE a.user.id LIKE :id AND a.video.id LIKE :vdid";
//	    TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
//	    query.setParameter("id", username);
//	    query.setParameter("vdid", videoId);
//	    try {
//	    	Favorite user = query.getSingleResult();
//	        return user;
//	    } catch (Exception e) {
//	        return null; // Return null when no user is found
//	    }
//	}
    
    public static List<Favorite> findAll() {
    	EntityManager em = JpaUtil.getEntityManager();
		String jpql = "SELECT a FROM Favorite a";
		// Tạo đối tượng truy vấn
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		// Truy vấn một thực thể
		List<Favorite> user = query.getResultList();
		return user;
	}
    
	public Favorite create(Favorite entity) {
		 EntityManager em = JpaUtil.getEntityManager();
		    
		    try {
		        em.getTransaction().begin(); // Bắt đầu Transaction
		        
		        Favorite managedEntity = em.merge(entity); // Sử dụng merge để đưa entity vào context quản lý
		        em.getTransaction().commit();
		        
		        System.out.println("Thêm mới thành công!");
		        return managedEntity;
		    } catch (Exception e) {
		        em.getTransaction().rollback(); // Hủy thao tác
		        System.out.println("Thêm mới thất bại!");
		        e.printStackTrace();
		        return null;
		    }
		
	}
    public Favorite update(Favorite entity) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Favorite updatedEntity = em.merge(entity);
            em.getTransaction().commit();
            return updatedEntity;
        } finally {
            em.close();
        }
    }
//    public Favorite delete(String username, String videoId) {
//    	EntityManager em = JpaUtil.getEntityManager();
//		try {
//			em.getTransaction().begin(); // Bắt đầu Transaction
//			// MÃ THAO TÁC
//			Favorite user = findOne(username,videoId);
//			em.remove(user);
//			em.getTransaction().commit();
//			System.out.println("Xoa thanh cong!");
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Hủy thao tác
//			System.out.println("Xoa that bai!");
//			e.printStackTrace();
//		}
//	return null;
//	}
    public void delete(String username, String videoId) {
        EntityManager em = JpaUtil.getEntityManager();
        
        try {
            em.getTransaction().begin(); // Bắt đầu Transaction
            
            Favorite favorite = findOne(username, videoId);
            
            if (favorite != null) {
                em.remove(favorite);
                em.getTransaction().commit();
                System.out.println("Xóa thành công!");
            } else {
                System.out.println("Không tìm thấy mục yêu thích để xóa.");
            }
        } catch (Exception e) {
            em.getTransaction().rollback(); // Hủy thao tác
            System.out.println("Xóa thất bại!");
            e.printStackTrace();
        }
    }
    
    public Favorite findOne(String username, String videoId) {
        EntityManager em = JpaUtil.getEntityManager();
        String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId AND f.video.id = :videoId";
        TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
        query.setParameter("userId", username);
        query.setParameter("videoId", videoId);
        
        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null; // Return null when no favorite is found
        }
    }
   
    
    
}
