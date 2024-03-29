#!/usr/bin/env perl
use v5.36;

# we start by defining a sub that checks how many different digits a number has:

my $target = 5;

sub different_digits {

    # this will build a hash in wich each present digit is a key
    my %diff = map { $_ => undef } split '', shift;

    # now we just return the amount of keys
    return scalar keys %diff;
}

my $num = 1;

$num++ while different_digits( $num * $num ) < $target;

say "First square with $target distinct digits is: ", $num * $num;
