package trg.talentsprint.starterkit.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Booking;

@Repository
public interface DiagnosticBookingRepository extends CrudRepository<Booking, Long>{

	@Query(value="select * from booking", nativeQuery = true)
	List<Booking> findalldetails();

	@Query(value="select * from booking where u_name=?1", nativeQuery = true)
	List<Booking> findBookingsByUname(String username);

	@Modifying
	@Transactional
	@Query(value="update booking set status='successful' where bid=?1", nativeQuery = true)
	public void UpdateStatusWithId(long bookingid);

	@Modifying
	@Transactional
	@Query(value="update booking set status=?1 where bid=?2", nativeQuery = true)
	public void UpdateStatus(String status, long bookingid);

	@Query(value="select * from booking where path=?1", nativeQuery = true)
	List<Booking> findBypath(String path);

	
	
}
