#!/usr/bin/env perl
use v5.36;

my $N = -1700;

my $sign = 1;
if ( $N < 0 )
{
    $sign = -1;
    $N = -$N;
}

# Adding 0 forces numeric, drops leading zeroes.
my $revN = 0 + reverse($N);

if ( ($revN > 0x7fffffff) )
{
    say 0;
}
else
{
    say $sign * $revN;
}
