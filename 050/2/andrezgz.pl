#!/usr/bin/env perl
use v5.36;

my @L = (19,11,9,7,20,3,17,16,2,14,1);
print 'List: ' . join ',', @L;

my @nobles;
for my $n (@L) {
    my $greater = grep { $_ > $n} @L;
    push @nobles, $n if $greater == $n;
}
print "\nNoble Integers: ", join ',', @nobles;
