package com.redframework.ws.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.redframework.ws.annotation.FunctionNamingConstraint;

/**
 * This code will be used later.
 * @author RedBelette
 * @since 1.0.0.
 */
public class FunctionNamingConstraintValidator implements ConstraintValidator<FunctionNamingConstraint, String> {

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if (s == null) {
            return false;
        }
        if (s.startsWith("RF_fnc_") && !s.contains(" ")) {
            return true;
        }
        return false;
    }
    
    @Override
    public void initialize(FunctionNamingConstraint functionNamingConstraint) {
        
    }
}
