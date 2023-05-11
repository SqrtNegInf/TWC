#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
use ntheory qw( gcd );

my $n = shift || 7;
say join(", ", farey_sequence($n));

sub farey_sequence {
    my($n) = @_;
    my @seq = ([0,1], [1,1]);   # first and last terms

    for my $i (1..$n) {
        for my $j ($i+1..$n) {
            if (gcd($i, $j)==1) {
                push @seq, [$i,$j];
            }
        }
    }

    @seq = sort { $a->[0]/$a->[1] <=> $b->[0]/$b->[1] } @seq;
    @seq = map {$_->[0].'/'.$_->[1]} @seq;

    return @seq;
}
