package entity;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;

import org.hibernate.annotations.NamedNativeQuery;

//@NamedStoredProcedureQueries({
//    @NamedStoredProcedureQuery(
//        name = "Title.favoriteByUser", 
//        procedureName = "spTitle",
//        parameters = {
//            @StoredProcedureParameter(name = "title", type = String.class)
//        }, 
//        resultClasses = { Title.class }
//    )
//})

@Entity
public class Title {
	@Id
	String username;
	String fullname;
	String email;
	Date datelike;
	public Title(String username, String fullname, String email, Date datelike) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.datelike = datelike;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDatelike() {
		return datelike;
	}
	public void setDatelike(Date datelike) {
		this.datelike = datelike;
	}
	

	

}
