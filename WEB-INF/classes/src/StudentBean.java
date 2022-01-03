package Model.Student;
 
public class StudentBean {
 
	private String prn;
	private String student_name;
	private String std_class;
	private String placement_status;
	private String company_name;
 
	public String getprn() {
		System.out.println("prn= "+prn);
		return prn;
	}
	public void setprn(String prn) {
		this.prn = prn;
	}
	public String getstudentName() {
		System.out.println("student_name= "+student_name);
		return student_name;
	}
	public void setstudentName(String student_name) {
		this.student_name = student_name;
	}
	public String getclass() {
		return std_class;
	}
	public void setclass(String std_class) {
		this.std_class = std_class;
	}
	public void setplacementStatus(String placement_status) {
		this.placement_status = placement_status;
	}
	public String getplacementStatus() {
		return placement_status;
	}
	public void setcompany(String company_name) {
		this.company_name = company_name;
	}
	public String getcompany() {
		return company_name;
	}
}