#!/usr/bin/env raku

sub MAIN($n = 20) {
    my @brilliant;
    for 2 .. * -> $i {
        @brilliant.push($i) if is-brilliant($i);
        last if @brilliant.elems == $n
    }
    say @brilliant.join(", ");
}

sub is-brilliant($dividend) {
    for 2 ..^ $dividend -> $divisor {
        if $dividend %% $divisor {
            my $quotient = $dividend/$divisor;
            my $l= log10($divisor).truncate;
            if $quotient.is-prime and $l == log10($quotient).truncate {
                return True;
            } else {
                return False;
            }
        }
    }
}
