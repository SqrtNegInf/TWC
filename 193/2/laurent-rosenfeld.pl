#!/usr/bin/env perl
use v5.36;

sub diff_array  {
    my $str = shift;
    my @diff;
    for my $i (1.. length($str) - 1) {
        push @diff,
            ord(substr($str, $i, 1))
            - ord(substr($str, $i-1, 1));
    }
    return "@diff";
}

for my $test ([<adc wzy abc>], [<aaa bob ccc ddd>]) {
    my %result;
    for my $st (@$test) {
        push @{$result{diff_array $st}}, $st;
    }
    for my $k (keys %result) {
        say "@$test -> ", @{$result{$k}} if scalar @{$result{$k}} == 1;
    }
}
