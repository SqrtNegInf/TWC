#!/usr/bin/env perl
use v5.36;

use ntheory qw( is_prime factor );

my @attractive = grep {is_attractive($_)} 1..50;
say join(", ", @attractive);

sub is_attractive {
    my($n) = @_;
    my @factors = factor($n);
    return is_prime(scalar(@factors));
}
