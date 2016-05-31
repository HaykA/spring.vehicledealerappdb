package com.vehicledealerapp.constraints;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.OverridesAttribute;
import javax.validation.Payload;
import javax.validation.constraints.NotNull;

@Target({ ElementType.FIELD } )
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {})
@NotNull
public @interface Country {
	@OverridesAttribute(constraint = NotNull.class, name = "message")
	String message() default "{com.vehicledealerapp.constraints.Country}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}
