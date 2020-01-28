package trg.talentsprint.starterkit.service;


import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import trg.talentsprint.starterkit.model.Test;
import trg.talentsprint.starterkit.repository.DiagnosticRepository;

@Service
public class DiagnosticService {

	private DiagnosticRepository repository;
	
	@Autowired
	public DiagnosticService(DiagnosticRepository repository) {
		this.repository=repository;
	}
		public List<String> findAllTests(){
			return repository.findAlltests();
		}
		
		public Test save(Test t) {
			return repository.save(t);
		}
	
		public Optional<Test> findById(Long tid){
			return repository.findById(tid);
			
		}
		public void deleteById(Long tId) {
			// TODO Auto-generated method stub
			repository.deleteById(tId);
		}
		public List<Test> findAll() {
	        return StreamSupport.stream(repository.findAll().spliterator(), false)
	                .collect(Collectors.toList());
	    }
		

}
