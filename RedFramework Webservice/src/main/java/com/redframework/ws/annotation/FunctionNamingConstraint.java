package com.redframework.ws.annotation;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.redframework.ws.validation.FunctionNamingConstraintValidator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * This code will be used later.
 * @author RedBelette
 * @since 1.0.0.
 */
@Constraint(validatedBy = FunctionNamingConstraintValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface FunctionNamingConstraint {

    String message() default "Function must respect naming convention RF_fnc_<functionName>";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };
}
