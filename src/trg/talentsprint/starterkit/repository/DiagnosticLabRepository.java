package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Lab;

@Repository
public interface DiagnosticLabRepository extends CrudRepository<Lab, Long>{
	
	@Query(value="select distinct lab_name from lab", nativeQuery = true)
	List<String> findAllLabs();

	@Query(value="select * from lab l join assign a ON l.lab_id = a.lab_id and t_id=?1",nativeQuery = true)
	List<Lab> findLabByTest(long tId);
}
