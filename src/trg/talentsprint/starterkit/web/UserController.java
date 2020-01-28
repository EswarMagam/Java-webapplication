package trg.talentsprint.starterkit.web;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import trg.talentsprint.starterkit.model.Booking;
import trg.talentsprint.starterkit.model.Lab;
import trg.talentsprint.starterkit.model.Test;
import trg.talentsprint.starterkit.model.User;
import trg.talentsprint.starterkit.service.DiagnosticAssignService;
import trg.talentsprint.starterkit.service.DiagnosticBookingService;
import trg.talentsprint.starterkit.service.DiagnosticLabService;
import trg.talentsprint.starterkit.service.DiagnosticService;
//import trg.talentsprint.starterkit.service.DiagnosticlabService;
import trg.talentsprint.starterkit.service.SecurityService;
import trg.talentsprint.starterkit.service.UserService;
import trg.talentsprint.starterkit.validator.UserValidator;

@Controller
public class UserController {

	@Value("${upload.location}")
	private String uploadDirectory;

	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private DiagnosticService service;

	public UserController(DiagnosticService service) {
		this.service = service;
	}

	@Autowired
	private DiagnosticLabService labservice;

	@Autowired
	private DiagnosticAssignService Assignservice;

	@Autowired
	private DiagnosticBookingService bookingservice;

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}

	@GetMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping({ "/", "/welcome" })
	public String welcome(Model model) {
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "welcome";
	}

	@GetMapping("/userWelcome")
	public String userhome(Model model) {

		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs());
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "userWelcome";

	}

	@GetMapping("/Mybookings")
	public String mybookings(@RequestParam(name = "username") String username, Model model) {

		List<Booking> mybookings = bookingservice.findBookingsByUserName(username);

		model.addAttribute("mybookings", mybookings);
		System.out.println(username);
		for (int i = 0; i < mybookings.size(); i++) {
			System.out.println(mybookings.get(i).getBid());
		}
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());
        
		return "MYBookings";

	}

	@GetMapping("/updateOrdelete")
	public String adminhome(Model model) {

		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs());
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "Home";

	}
	@GetMapping("/Home")
	public String home(Model model) {

		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs());
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "welcome";

	}

	@GetMapping("/addLab")
	public String add(Model model) {
		model.addAttribute("labs", new Lab());
		return "NewLab";

	}

	@PostMapping(value = "/addNewLab", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String addNewEmployee(@Valid @ModelAttribute Lab labs, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "NewLab";
		}
		labservice.savelab(labs);
		model.addAttribute("lablist", labservice.findAllLabs());
		List<String> tlist = service.findAllTests();
		model.addAttribute("tlist", tlist);
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());
		return "Home";
	}

	@GetMapping("/addTest")
	public String addtest(Model model) {
		model.addAttribute("tests", new Test());
		return "NewTest";

	}

	@PostMapping(value = "/addNewTest", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String addNewEmployee(@Valid @ModelAttribute Test tests, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "NewTest";
		}
		service.save(tests);
		model.addAttribute("lablist", labservice.findAllLabs());// lab names
		model.addAttribute("AllLabdetails", labservice.findAll());

		List<String> tlist = service.findAllTests();
		model.addAttribute("tlist", tlist);
		model.addAttribute("AllTestdetails", service.findAll());
		return "Home";
	}

	@GetMapping("/{labId}")
	public String showUpdateLabpage(@PathVariable Long labId, Model model) {
		model.addAttribute("labs", new Lab());
		/* model.addAttribute("lablist", labservice.findAllLabs()); */
		Lab labobj = labservice.findById(labId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid Lab Id:" + labId));
		model.addAttribute("labs", labobj);
		return "UpdateLab";

	}

	@PostMapping("/{labId}/UpdateLab")
	public String updateTest(@PathVariable Long labId, @Valid @ModelAttribute Lab labs, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "UpdateLab";
		}

		labservice.findById(labId).orElseThrow(() -> new IllegalArgumentException("Invalid Lab Id:" + labId));
		labservice.savelab(labs);
		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs()); // Lab Names
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "redirect:/Home";

	}

	@GetMapping("/{labId}/delete")
	public String deleteLab(@PathVariable Long labId, Model model) {

		labservice.findById(labId).orElseThrow(() -> new IllegalArgumentException("Invalid Lab Id:" + labId));

		labservice.deleteById(labId);
		// System.out.println(labId);
		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs()); // Lab Names
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "redirect:/welcome";

	}

	@GetMapping("/{tId}/testid")
	public String showUpdateTestpage(@PathVariable Long tId, Model model) {
		model.addAttribute("tests", new Test());
		/* model.addAttribute("lablist", labservice.findAllLabs()); */
		Test testobj = service.findById(tId).orElseThrow(() -> new IllegalArgumentException("Invalid Lab Id:" + tId));
		model.addAttribute("tests", testobj);

		return "UpdateTest";

	}

	@PostMapping("/{tId}/Updatetest")
	public String updateTest(@PathVariable Long tId, @Valid @ModelAttribute Test tests, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "UpdateLab";
		}
		service.findById(tId).orElseThrow(() -> new IllegalArgumentException("Invalid Lab Id:" + tId));
		service.save(tests);

		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs()); // Lab Names
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "redirect:/Home";

	}

	@GetMapping("/{tId}/deletetest")
	public String deletetest(@PathVariable Long tId, Model model) {

		service.findById(tId).orElseThrow(() -> new IllegalArgumentException("Invalid Lab Id:" + tId));

		service.deleteById(tId);
		// System.out.println(tId);
		model.addAttribute("tlist", service.findAllTests());
		model.addAttribute("lablist", labservice.findAllLabs()); // Lab Names
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "redirect:/Home";

	}

	@GetMapping("/assignbutton")
	public String assignbutton(Model model) {
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());
		return "Assign";

	}

	@GetMapping("/assign")
	public String AssignLabandTest(Model model, @RequestParam(name = "lid") long[] lid,
			@RequestParam(name = "tid") long[] tid) {

		for (long long1 : tid) {
			for (long long2 : lid) {
				Assignservice.Insert(long1, long2);
				long2++;
			}
			long1++;
		}
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "welcome";

	}

	@GetMapping("/search") // Uri from Home.jsp
	public String SearchTestAvailability(@RequestParam(name = "searchTest") String testname, Model model) {

		long tId = Assignservice.findIdByName(testname);
		// List<String> AvailableLabs = Assignservice.findLabForTest(tId);
		// model.addAttribute("AvailableLabs", Assignservice.findLabForTest(tId)); from
		// assign repository

		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		List<Lab> Availablelabdetails = labservice.findLabForTest(tId); // from lab repository
		model.addAttribute("Availablelabdetails", Availablelabdetails);
		/*
		 * for(int i=0;i<Availablelabdetails.size();i++) {
		 * 
		 * System.out.println("lname"+Availablelabdetails.get(i).getLabName());
		 * System.out.println("location"+Availablelabdetails.get(i).getLabLocation());
		 * 
		 * }
		 */
		model.addAttribute("testname", testname);

		return "Searchresults";

	}

	@GetMapping("/book")
	public String booking(@RequestParam(name = "testname") String testname,
			@RequestParam(name = "labname") String labname, @RequestParam(name = "username") String username,
			Model model) {

		model.addAttribute("testname", testname);
		model.addAttribute("labname", labname);
		model.addAttribute("username", username);
		return "BookingDetails";

	}

	@PostMapping("/bookingdetails") // from bookingdetails.jsp
	public String bookingdetails(@RequestParam(name = "testname") String testname,
			@RequestParam(name = "labname") String labname, @RequestParam(name = "username") String username,
			@RequestParam(name = "bookingdate") String bookingdate, @RequestParam(name = "timeslot") String timeslot,
			@RequestParam(name = "userdetails") String userdetails, @RequestParam("file") MultipartFile[] files,
			Model model) {

		String s = "pending";
		Booking b = new Booking();
		b.settName(testname);
		b.setlName(labname);
		b.setuName(username);
		b.setDate(bookingdate);
		b.setTimeslot(timeslot);

		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();

		b.setPath(path);
		b.setUserDetails(userdetails);

		b.setStatus(s);

		bookingservice.savebooking(b);
		model.addAttribute("AllLabdetails", labservice.findAll());
		model.addAttribute("AllTestdetails", service.findAll());

		return "userWelcome";

	}

	/*
	 * @GetMapping("/bookings") public String bookings(Model model) {
	 * 
	 * List<Booking> bookings = bookingservice.findAllDetails();
	 * 
	 * 
	 * for(int i=0;i<bookings.size();i++) {
	 * System.out.println("userdetalis"+bookings.get(i).getUserDetails()); }
	 * 
	 * 
	 * model.addAttribute("bookings", bookings);
	 * 
	 * return "AllBookings";
	 * 
	 * }
	 */
	@GetMapping("/bookings")
	public String bookings(Model model) {

		List<Booking> bookings = bookingservice.findAllDetails();

		/*
		 * for(int i=0;i<bookings.size();i++) {
		 * System.out.println("userdetalis"+bookings.get(i).getUserDetails()); }
		 */

		model.addAttribute("bookings", bookings);

		return "AllBookings";

	}

	@GetMapping("/{bid}/Accept")
	public String Acceptbooking(@PathVariable long bid, Model model) {

		bookingservice.UpdateStatusById(bid);

		List<Booking> bookings = bookingservice.findAllDetails();
		model.addAttribute("bookings", bookings);
		return "AllBookings";

	}

	@GetMapping("/{bid}/Reject")
	public String Rejectbooking(@PathVariable long bid, Model model) {
		String status = "Rejected";
		/*
		 * Booking b = new Booking(); b.setStatus(status);
		 */
		bookingservice.UpdateStatus(status, bid);

		List<Booking> bookings = bookingservice.findAllDetails();
		model.addAttribute("bookings", bookings);
		return "AllBookings";

	}

	@GetMapping("/{path}/view")
	public String viewprescription(@PathVariable String path, Model model) {

		model.addAttribute("images", path);
		return "View";

	}

	/*
	 * @GetMapping("/index") public String index(Model model) {
	 * 
	 * return "Index";
	 * 
	 * }
	 */

}
