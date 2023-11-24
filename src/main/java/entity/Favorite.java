package entity;


import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@NamedQueries({
	@NamedQuery(name="Favorite.findByKeyword", query="SELECT DISTINCT o.video FROM Favorite o WHERE o.video.title LIKE :id"),
	@NamedQuery(name="Favorite.findByDate", query="SELECT o.video FROM Favorite o WHERE o.LikeDate BETWEEN :mindate AND :maxdate "),
	@NamedQuery(name="Favorite.findByMonth", query="SELECT o.video FROM Favorite o WHERE MONTH(LikeDate) IN (:date)"),
	@NamedQuery(name="Favorite.findByUser", query="SELECT o.video FROM Favorite o WHERE o.user.id LIKE :id"),
	@NamedQuery(name="Favorite.findByVideo", query="SELECT o.video FROM Favorite o WHERE o.user.id LIKE :id AND o.video.id LIKE :video"),
	@NamedQuery(name = "Favorite.Delete", query = "DELETE FROM Favorite f WHERE f.user.id = :userId AND f.video.id = :videoId")


})
@Entity
@Table(name = "Favorites", uniqueConstraints={
@UniqueConstraint(columnNames = {"VideoId" , "UserId"})
})
public class Favorite {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@ManyToOne @JoinColumn(name = "UserId")
	User user;
	@ManyToOne @JoinColumn(name = "VideoId")
	Video video;
	@Temporal(TemporalType.DATE)
	Date LikeDate = new Date();
	public Favorite(long id, User user, Video video, Date LikeDate) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		this.LikeDate = LikeDate;
	}
	public Favorite() {
		super();
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public Date getLikeDate() {
		return LikeDate;
	}
	public void setLikeDate(Date LikeDate) {
		this.LikeDate = LikeDate;
	}
	
	
	
	
}
