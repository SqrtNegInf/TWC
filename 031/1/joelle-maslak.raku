#!/usr/bin/env raku

sub MAIN($numerator = 42, $denominator = 0) {
    if test-for-div-by-zero($numerator, $denominator) {
        say "Denominator is zero";
    } else {
        say "Denominator is not zero";
    }
}

sub test-for-div-by-zero($numerator, $denominator) {
    ($numerator / $denominator).Int.sink;

    return; # Not div by zero

    CATCH {
        when X::Numeric::DivideByZero {
            return 1; # Div by zero
        }
    }
}

