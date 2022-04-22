#!/usr/bin/env raku

sub isDividedByZero($numerator, $denominator) {
        ($numerator / $denominator).grep({});

        CATCH {
            default {
                return True;
            }
        }

    return False;
}

#sub MAIN(Int $numerator, Int $denominator) {
    say isDividedByZero(42, 1) ?? 'yes' !! 'no';
    say isDividedByZero(42, 0) ?? 'yes' !! 'no';
#}
