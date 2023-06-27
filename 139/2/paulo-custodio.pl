#!/usr/bin/env perl
use v5.36;

use Math::BigFloat;
use ntheory 'next_prime';

Math::BigFloat->accuracy(1000);         # very long list of digits

my $N = shift||5;
my $prime = 2;
for (1..$N) {
    while (!is_long_prime($prime)) {
        $prime = next_prime($prime);
    }
    say $prime;
    $prime = next_prime($prime);
}

sub is_long_prime {
    my($p) = @_;
    my $inv = Math::BigFloat->new(1) / Math::BigFloat->new($p);
    if (rept_sequence($inv, $p-1)==$p-1) {
        return 1;
    }
    else {
        return 0;
    }
}

sub rept_sequence {
    my($n, $max) = @_;
    for my $rept (1..$max) {
        my $rept1 = $rept-1;
        my $code = "\$n =~ /\\.(\\d{$rept})\\1+\\d{0,$rept1}\$/;";
        if (eval $code) {
            return $rept;
        }
    }
    return -1;
}
