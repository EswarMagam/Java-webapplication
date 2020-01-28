package trg.talentsprint.starterkit.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Booking {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long bid;
	
	private String uName;
	private String lName;
	private String tName;
	private String date;
	private String path;
	private String timeslot;
	
	private String userDetails;
	
	private String status;
	
	public Booking() {
		super();
	}
	
	

	/*
	 * public Booking(long bid, String uName, String lName, String tName, String
	 * date, String path, String timeslot, String userDetails, String status) {
	 * super(); this.bid = bid; this.uName = uName; this.lName = lName; this.tName =
	 * tName; this.date = date; this.path = path; this.timeslot = timeslot;
	 * UserDetails = userDetails; this.status = status; }
	 */



	public long getBid() {
		return bid;
	}
	public void setBid(long bid) {
		this.bid = bid;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTimeslot() {
		return timeslot;
	}
	public void setTimeslot(String timeslot) {
		this.timeslot = timeslot;
	}
	public String getUserDetails() {
		return userDetails;
	}
	public void setUserDetails(String userDetails) {
		this.userDetails = userDetails;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
    
	
}
