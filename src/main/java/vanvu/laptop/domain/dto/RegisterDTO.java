package vanvu.laptop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import vanvu.laptop.service.validator.RegisterChecked;

@RegisterChecked
public class RegisterDTO {

    @Size(min = 3, message = "Họ phải có ít nhất 3 ký tự.")
    private String firstName;

    private String lastName;

    @Email(regexp = "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}", message = "Email không hợp lệ")
    private String email;

    private String password;

    @Size(min = 3, message = "Mật khẩu xác nhận không được để trống.")
    private String passwordConfirm;
    
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;    
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPasswordConfirm() {
        return passwordConfirm;
    }
    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }


}
