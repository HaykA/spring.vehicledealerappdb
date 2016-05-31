package com.vehicledealerapp.constraints;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.OverridesAttribute;
import javax.validation.Payload;
import javax.validation.constraints.Pattern;

import com.vehicledealerapp.util.RegexManager;

@Target({ ElementType.FIELD } )
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {})
@Pattern(regexp = RegexManager.NULL_EMAIL_REGEX)
public @interface NullEmail {
	@OverridesAttribute(constraint = Pattern.class, name = "message")
	String message() default "{com.vehicledealerapp.constraints.Email}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}
