package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Lab {
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long labId;
	
	private String labName;
	private String labLocation;
	
	
	
	
	  public Lab() { super(); }
	 


	public Lab(String labName, String labLocation) {
		super();
		this.labName = labName;
		this.labLocation = labLocation;
	}


	public Lab(long labId, String labName, String labLocation) {
		super();
		this.labId = labId;
		this.labName = labName;
		this.labLocation = labLocation;
	}


	public long getLabId() {
		return labId;
	}


	public void setLabId(long labId) {
		this.labId = labId;
	}


	public String getLabName() {
		return labName;
	}


	public void setLabName(String labName) {
		this.labName = labName;
	}


	public String getLabLocation() {
		return labLocation;
	}


	public void setLabLocation(String labLocation) {
		this.labLocation = labLocation;
	}


	
	
}
