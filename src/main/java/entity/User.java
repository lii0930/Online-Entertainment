package entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQuery;

import javax.persistence.OneToMany;

/**
 * The persistent class for the Users database table.
 * 
 */

@Entity
@Table(name="Users")
public class User {
//	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "admin")
	private boolean admin;
	@Column(name = "email")
	private String email;
	@Column(name = "fullname")
	private String fullname;
	@Column(name = "password")
	private String password;
	@OneToMany(mappedBy = "user")
	List <Favorite> favorites;
	public List<Favorite> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	public User() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean getAdmin() {
		return this.admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}