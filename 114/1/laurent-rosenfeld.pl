#!/usr/bin/env perl
use v5.36;

my $num = shift // 1234;
$num =~ s/^0+//; # remove leading 0s just in case
while (++ $num) {
    say $num and last if $num eq reverse $num;
}
