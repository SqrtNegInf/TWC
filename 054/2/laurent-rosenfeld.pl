#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/say/;

sub next_collatz {
    my $num = shift;
    $num % 2 ? 3 * $num + 1 : $num / 2;
}

my $n = 23;
my @result = ($n);
while (1) {
    $n = next_collatz $n;
    push @result, $n;
    last if $n == 1;
}
say "@result";
