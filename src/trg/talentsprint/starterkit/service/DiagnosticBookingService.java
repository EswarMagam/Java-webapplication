package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Booking;

import trg.talentsprint.starterkit.repository.DiagnosticBookingRepository;

@Service
public class DiagnosticBookingService{

	private DiagnosticBookingRepository bookingRepository;
	
	@Autowired
	public DiagnosticBookingService(DiagnosticBookingRepository bookingRepository) {
		this.bookingRepository=bookingRepository;
	}

	public Booking savebooking(Booking b) {
		return bookingRepository.save(b);
		// TODO Auto-generated method stub
		
		
	}

	public List<Booking> findAll() {
        return StreamSupport.stream(bookingRepository.findAll().spliterator(), false)
                .collect(Collectors.toList());
    }

	public List<Booking> findAllDetails() {
	
		return bookingRepository.findalldetails();
	}

	public List<Booking> findBookingsByUserName(String username) {
		return bookingRepository.findBookingsByUname(username);
		// TODO Auto-generated method stub
		
	}

	public void UpdateStatusById(long bookingid) {
		 bookingRepository.UpdateStatusWithId(bookingid);
		
		
	}

	public void UpdateStatus(String status, long bookingid) {
		bookingRepository.UpdateStatus(status,bookingid);
		// TODO Auto-generated method stub
	
	}

	public List<Booking> findByPath(String path) {
		return bookingRepository.findBypath(path);
		// TODO Auto-generated method stub
		
	}
	
	
}
