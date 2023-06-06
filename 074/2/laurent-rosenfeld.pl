#!/usr/bin/env perl
use v5.36;

my $S = 'ababcbad';
my @chars = split //, $S;
my $result = "";
my %seen;
for (@chars) {
    my $fnr = "#";
    for my $char (@chars) {
        $fnr = $char and last unless $seen{$char};
        $fnr = $char and last if $seen{$char} < 2;
    }
    $result .= $fnr;
    $seen{$_} ++;
}
say $result;
