package entity;

import java.util.List;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

@NamedNativeQueries({
@NamedNativeQuery(name = "Report.random10",
query = "SELECT TOP 10 * FROM Videos ORDER BY newid()", 
resultClass = Video.class)
})

@NamedQueries({
	@NamedQuery(name = "Video.findAll", query = "SELECT v FROM Video v"),
})
@Entity
@Table(name = "Videos")
public class Video {
	@Id
	@Column (name="Id")
	private String id;
	@Column (name="Title")
	private String title ;
	@Column (name="Description")
	private String description;
	@Column (name="Active")
	private boolean active;
	private String poster;
	@Column (name="Views")
	private double view;
	@OneToMany(mappedBy = "video")
	List<Favorite> favorites;
	
	public List<Favorite> getFavorites() {
		return favorites;
	}
	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}
	public Video(String id, String title, String description, boolean active, String poster, double view) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.active = active;
		this.poster = poster;
		this.view = view;
	}
	public Video() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public double getView() {
		return view;
	}
	public void setView(double view) {
		this.view = view;
	}
	
	
}
