#!/usr/bin/env perl
use v5.36;

my $n = abs(shift||1234567);
my $len = length($n);
if ($len%2==0) {
    say "even number of digits";
}
elsif ($len<3) {
    say "too short";
}
else {
    say substr($n, ($len-3)/2, 3);
}
