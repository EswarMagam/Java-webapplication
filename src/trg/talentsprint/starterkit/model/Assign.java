package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Assign {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private long labId;
	private long tId;
	
	
	public Assign() {
		super();
	}


	public Assign(long labId, long tId) {
		super();
		this.labId = labId;
		this.tId = tId;
	}


	public Assign(long id, long labId, long tId) {
		super();
		this.id = id;
		this.labId = labId;
		this.tId = tId;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public long getLabId() {
		return labId;
	}


	public void setLabId(long labId) {
		this.labId = labId;
	}


	public long gettId() {
		return tId;
	}


	public void settId(long tId) {
		this.tId = tId;
	}
	
	
	
	
	
}
