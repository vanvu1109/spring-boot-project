package vanvu.laptop.service.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
// import vanvu.laptop.service.validator.StrongPasswordValidator;

@Constraint(validatedBy = StrongPasswordValidator.class)
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RUNTIME)
@Documented
public @interface StrongPassword {
    String message() default "Password must be at least 8 characters long and include uppercase, lowercase, digit, and special character.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
