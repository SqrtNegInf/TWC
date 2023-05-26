#!/usr/bin/env perl
use v5.36;

use List::Util qw(first); 

sub firstOver($s1,$s2) {
    my @runs = map { my $l = $_; my @run = map { $_ + $s1 } (0..$l); \@run } (0..length($s2));
    return first { length(join "", @{$_}) >= length($s2) } @runs;
}

sub inits($s) {
    my @inits=map { substr($s,0,$_) } (1..length $s);
    return \@inits;
}

sub consecSplit($s) {
    return first { join("", @{$_}) eq $s } map {firstOver($_,$s)} @{inits($s)};
}

my @split=@{consecSplit(91011)};
say "@split";
