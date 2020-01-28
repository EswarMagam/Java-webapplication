package trg.talentsprint.starterkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Assign;
//import trg.talentsprint.starterkit.model.Lab;
import trg.talentsprint.starterkit.repository.DiagnosticAssignRepository;

@Service
public class DiagnosticAssignService {

	private DiagnosticAssignRepository assignRepository;
	
	@Autowired
	public DiagnosticAssignService(DiagnosticAssignRepository assignRepository) {
		this.assignRepository=assignRepository;
	}

	public long findIdByName(String testname) {
		// TODO Auto-generated method stub
		return assignRepository.findIdByName(testname);
	}

	public long findlabIdByName(String labname) {
		// TODO Auto-generated method stub
		return assignRepository.findLabIdByName(labname);
	}

	public Assign saveAssignment(Assign a) {
		return assignRepository.save(a);
	}

	public List<String> findLabForTest(long tId) {
		return assignRepository.findLabByTest(tId);
		
	}

	public void Insert(long long1, long long2) {
		assignRepository.insert(long1,long2);
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
