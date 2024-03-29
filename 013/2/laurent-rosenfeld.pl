#!/usr/bin/env perl
use v5.36;

sub female {
    my $n = shift;
    return 1 if $n == 0;   # base case
    return $n - male (female ($n - 1));
}
sub male {
    my $n = shift;
    return 0 if $n == 0;   #base case
    return $n - female (male ($n - 1));
}
say "Female sequence: ";
printf "%d ", female $_ for 0..19;
say "";
say "Male sequence:";
printf "%d ", male $_ for 0..19;
say "";
