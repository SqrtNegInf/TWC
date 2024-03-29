#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum };

use constant COUNT => 4;

sub is_perfect {
    my ($n) = @_;
    my @divisors = grep 0 == $n % $_, 1 .. $n - 1;
    return sum(@divisors) == $n
}

my $n = 2;
my $so_far = 0;
while ($so_far < COUNT) {
    ++$so_far, say $n if is_perfect($n);
    ++$n
}
