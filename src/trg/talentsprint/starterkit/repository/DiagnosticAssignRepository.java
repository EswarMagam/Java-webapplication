package trg.talentsprint.starterkit.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Assign;


@Repository
public interface DiagnosticAssignRepository extends CrudRepository<Assign, Long>{

	@Query(value="select t_id from test where test_name=?1",nativeQuery = true)
	long findIdByName(String testname);

	@Query(value="select lab_id from lab where lab_name=?1",nativeQuery = true)
	long findLabIdByName(String labname);

	@Query(value="select lab_name from lab l join assign a ON l.lab_id = a.lab_id and t_id=?1",nativeQuery = true)
	List<String> findLabByTest(long tId);

	

	@Modifying
	@Transactional
	@Query(value="insert into assign values(0,?2,?1)", nativeQuery = true)
	public void insert(long long1, long long2);

	/*
	 * @Query(
	 * value="select * from lab l join assign a ON l.lab_id = a.lab_id and t_id=?1")
	 * List<Lab> findLabForTest(long tId);
	 */

}
