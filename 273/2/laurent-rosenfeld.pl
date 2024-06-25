#!/usr/bin/env perl
use v5.36;

sub b_after_a {
    return shift =~ /^[^b]*b[^a]*$/ ? "true" : "false";
}

for my $test (qw<aabb abab aaa bbb>) {
    printf "%-5s => ", $test;
    say b_after_a $test;
}
