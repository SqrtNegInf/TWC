#!/usr/bin/env perl
use v5.36;

sub next_seq {
    state $n = 0;
    while (1) {
        $n++;
        return $n if $n =~ /^[123]+$/ && $n !~ /11/;
    }
}

my $N = shift // 60;
my $n;
$n = next_seq() for 1 .. $N;
say $n;
