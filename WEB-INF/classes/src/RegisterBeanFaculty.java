package Model.Register;
 
public class RegisterBeanFaculty {
 
	private String fullName;
	private String email;
	private String password;
	private String phone;
	private String role;
 
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRole() {
		return role;
	}
}