package vanvu.laptop.service.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Constraint(validatedBy = RegisterValidator.class)
@Target(ElementType.TYPE)
@Retention(RUNTIME)
@Documented 
public @interface RegisterChecked {
    String message() default "User Register validation failed.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}

