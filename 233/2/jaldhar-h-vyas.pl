#!/usr/bin/env perl
use v5.36;

sub classify {
    my %count;

    for my $n (@_) {
        push @{$count{$n}}, $n;
    }
    return %count;
}

my %freq = classify(@ARGV);

say q{(},
    (
        join q{,},
        map { @{$freq{$_}} }
        sort { scalar @{$freq{$a}} <=> scalar @{$freq{$b}} || $b <=> $a }
        keys %freq
    ),
q{)};
