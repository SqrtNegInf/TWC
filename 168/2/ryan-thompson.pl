#!/usr/bin/env perl
use v5.36;
use Math::Prime::Util qw< factor >;

# Home prime, iterative implementation is ~20% faster on my system
#sub home_prime {
    my $n = 10;

    while ((my @fac = factor($n)) > 1) {
        $n = join '', @fac;
    }

    say $n
#}

__END__
# Home prime, recursive implementation
sub home_prime_recursive {
    my @fac = factor($_[0]);

    @fac == 1 ? $_[0] : home_prime(join '', @fac);
}
