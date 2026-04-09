package vanvu.laptop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vanvu.laptop.domain.dto.RegisterDTO;
import vanvu.laptop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;
    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    
    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        if (user == null) {
            return true; // Let @NotNull handle this case
        }
        boolean valid = true;

        if (!user.getPassword().equals(user.getPasswordConfirm())) {
            context.buildConstraintViolationWithTemplate("Mật khẩu xác nhận không khớp.")
                    .addPropertyNode("passwordConfirm")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        if (this.userService.checkEmailExist(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email đã tồn tại.")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        return valid;
    }
}