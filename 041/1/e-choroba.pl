#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw{ factor is_prime };

sub is_attractive {
    my ($n) = @_;
    is_prime(factor($n))
}

say for grep is_attractive($_), 1 .. 50;


