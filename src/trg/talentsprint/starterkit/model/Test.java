package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long tId;
	private String testName;
	
	public Test() {
		super();
	}
	
	
	public Test(String testName) {
		super();
		this.testName = testName;
	}


	public Test(long tId, String testName) {
		super();
		this.tId = tId;
		this.testName = testName;
	}
	public long gettId() {
		return tId;
	}
	public void settId(long tId) {
		this.tId = tId;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	
	
	
}
