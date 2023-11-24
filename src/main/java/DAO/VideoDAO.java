package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Video;
import entity.Video;
import utils.JpaUtil;




public class VideoDAO {
	

    
//    public List<Video> findAll() {
//    	String jpql = "SELECT v FROM Video v";
//		// Tạo đối tượng truy vấn
//		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
//		// Truy vấn một thực thể
//		List<Video> v = query.getResultList();
//		return v;
//    }
	public Video create(Video entity) {
		EntityManager em = JpaUtil.getEntityManager();
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
	
	public Video update(Video entity) {
	    EntityManager em = JpaUtil.getEntityManager();
	    Video updatedVideo = null; // Khởi tạo biến để chứa kết quả cập nhật
	    try {
	        em.getTransaction().begin(); // Bắt đầu Transaction
	        // MÃ THAO TÁC
	        TypedQuery<Video> query = em.createQuery("SELECT v FROM Video v WHERE v.id = :id", Video.class);
	        query.setParameter("id", entity.getId());
	        List<Video> videos = query.getResultList();

	        if (!videos.isEmpty()) {
	            Video Video = videos.get(0);
	            Video.setActive(entity.isActive());
	            Video.setDescription(entity.getDescription());
	            Video.setPoster(entity.getPoster());
	            Video.setTitle(entity.getTitle());
	            Video.setView(entity.getView());
	            updatedVideo = em.merge(Video); // Lưu lại video đã cập nhật
	            em.getTransaction().commit();
	            System.out.println("Cập nhật thành công!");
	        } else {
	            System.out.println("Video không tồn tại!");
	        }
	    } catch (Exception e) {
	        em.getTransaction().rollback(); // Hủy thao tác
	        System.out.println("Cập nhật thất bại!");
	        e.printStackTrace();
	    } finally {
	        em.close(); // Đảm bảo đóng EntityManager sau khi sử dụng
	    }
	    return updatedVideo; // Trả về video đã cập nhật hoặc null nếu có lỗi
	}
	
	
	public Video delete(String Videoname) {
		 EntityManager em = JpaUtil.getEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			Video Video = em.find(Video.class, Videoname);
			em.remove(Video);
			em.getTransaction().commit();
			System.out.println("Xoa thanh cong!");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Xoa that bai!");
			e.printStackTrace();
		}
	return null;
	}

    
    public  List<Video> selectAll(){
		EntityManager em = JpaUtil.getEntityManager();
		TypedQuery<Video> query = em.createNamedQuery("Video.findAll", Video.class);
		return query.getResultList();
	}
    
 
    public Video findById(String id) {
    	EntityManager em = JpaUtil.getEntityManager();
	    String jpql = "SELECT a FROM Video a WHERE a.id=:id";
	    TypedQuery<Video> query = em.createQuery(jpql, Video.class);
	    query.setParameter("id", id);
	    
	    try {
	      Video v = query.getSingleResult();
	        return v;
	    } catch (Exception e) {
	        return null; // Return null when no Video is found
	    }
	}
//    
    

}
