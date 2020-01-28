package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Lab;
import trg.talentsprint.starterkit.model.Test;
import trg.talentsprint.starterkit.repository.DiagnosticLabRepository;

@Service
public class DiagnosticLabService {

	private DiagnosticLabRepository labrepository;

	@Autowired
	public DiagnosticLabService(DiagnosticLabRepository labrepository) {
		this.labrepository = labrepository;

	}

	public Lab savelab(Lab lab) {
		return labrepository.save(lab);

	}

	public List<String> findAllLabs() {
		return labrepository.findAllLabs();
	}

	public Optional<Lab> findById(Long id) {
		return labrepository.findById(id);
	}

	public List<Lab> findAll() {
        return StreamSupport.stream(labrepository.findAll().spliterator(), false)
                .collect(Collectors.toList());
    }
    
	public void deleteById(Long labid) {
		labrepository.deleteById(labid);
	}
	
	public List<Lab> findLabForTest(long tId) {
		return labrepository.findLabByTest(tId);
		
	}
}
