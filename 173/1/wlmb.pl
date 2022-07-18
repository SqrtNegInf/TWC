#!/usr/bin/env perl

use v5.36;
use List::Util qw(all);
foreach(<5456 120 121 23456 2346 7654567 765467>){
    s/^\s*\+\s*//;  # remove leading +, if present
    say("Error: $_ is not a positive number"), next unless $_=~/^\d+$/;
    my ($current,@rest)=split "";
    my $test;
    say "$_ ", (
        (all {($current,$test)=($_, abs($_-$current)==1); $test}(@rest))
        ? "is"
        : "is not"
        ), " an esthetic number";
}
