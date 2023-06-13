#!/usr/bin/env perl
use v5.36;

my $number = join '', 55;

unless ($number =~ /^\d*$/) {
    say "Argument: $number needs to be a number";
    exit;
}

my $i = 1;
my $new_number = $number;
while (!($new_number =~ /^[01]+$/)) {
    $new_number = $number * $i++;
}

say "Smallest multiple of $number is $new_number";
