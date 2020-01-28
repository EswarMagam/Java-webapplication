package trg.talentsprint.starterkit.repository;

import java.util.List;



import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import trg.talentsprint.starterkit.model.Test;

@Repository
public interface DiagnosticRepository extends CrudRepository<Test, Long>{

	@Query(value="select distinct test_name from test", nativeQuery = true)
	List<String> findAlltests();

	@Query(value="select distinct lab_name from lab", nativeQuery = true)
	List<String> findAllLabs();

	
    
}
