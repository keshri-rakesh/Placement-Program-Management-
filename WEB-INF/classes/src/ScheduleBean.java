package Model.Company;
 
public class ScheduleBean {
 
	private String company_id ;
	private String company_name;
	private String language;
	private String job_type;
	private String location;
	private String upcoming_date;
	private String time_slot;
 
	public String getcompany_id () {
		System.out.println("company_id = "+company_id );
		return company_id ;
	}
	public void setcompany_id (String company_id ) {
		this.company_id  = company_id ;
	}
	public String getcompany_name() {
		System.out.println("company_name= "+company_name);
		return company_name;
	}
	public void setcompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getlanguage() {
		return language;
	}
	public void setlanguage(String language) {
		this.language = language;
	}
	public void setjob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getjob_type() {
		return job_type;
	}
	public void setlocation(String location) {
		this.location = location;
	}
	public String getlocation() {
		return location;
	}
	public void setupcoming_date(String upcoming_date) {
		this.upcoming_date = upcoming_date;
	}
	public String getupcoming_date() {
		return upcoming_date;
	}
	public void settime_slot(String time_slot) {
		this.time_slot = time_slot;
	}
	public String gettime_slot() {
		return time_slot;
	}
}