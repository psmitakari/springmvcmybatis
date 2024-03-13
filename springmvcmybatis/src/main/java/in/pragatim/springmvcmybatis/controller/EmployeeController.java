package in.pragatim.springmvcmybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.pragatim.springmvcmybatis.dao.EmployeeMapper;
import in.pragatim.springmvcmybatis.entity.Employee;



@Controller

public class EmployeeController {

    @Autowired
    EmployeeMapper mapper;

	@RequestMapping("/")
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView("list-employees");
//		System.out.println(mapper.getAllEmployees());
		mav.addObject("listemployees",mapper.getAllEmployees());
		return mav;
		//return "list-employees";
		
	}
	@RequestMapping("/showFormForAddEmployee")
	public ModelAndView showForm() {
		ModelAndView mav = new ModelAndView("add-employee");
		mav.addObject("employee", new Employee());
		return mav;
	}
	
	@RequestMapping("/saveProcess")
	public String saveProcess(@ModelAttribute("employee")Employee employee) {
	
		if(employee.getId() == null) {
			//save operation
			//System.out.println("Employee object:"+employee);
			mapper.saveEmployee(employee);
			
		} else {
			//update operation
			mapper.updateEmployee(employee);
		}
		
		return "redirect:/";
		//System.out.println("Employee object:"+employee);
	}
	
	
	@RequestMapping("/deleteemployee")
	public String deleteEmployee(@RequestParam("employeeId") int employeeId) {
		mapper.deleteEmployee(employeeId);
//		System.out.println("Employee ID"+employeeId);
		return "redirect:/";
		
	}
	
	@RequestMapping("/editemployee")
	public ModelAndView editEmployee(@RequestParam("employeeId") int employeeId) {
		
		ModelAndView mav = new ModelAndView("add-employee");
		Employee employee = mapper.findById(employeeId);
		mav.addObject("employee",employee);
		//System.out.println("Employee Id: "+employeeId);
		return mav;
		
	}
	
	
	
	
	
	
	
}