#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub permute :prototype(&@) {
    my $code = shift;
    my @idx = 0..$#_;
    while ( $code->(@_[@idx]) ) {
        my $p = $#idx;
        --$p while $idx[$p-1] > $idx[$p];
        my $q = $p or return;
        push @idx, reverse splice @idx, $p;
        ++$q while $idx[$p-1] > $idx[$q];
        @idx[$p-1,$q]=@idx[$q,$p-1];
    }
}

my @labels = 'a' .. 'g';
my @permutations;
permute { push @permutations, \@_; } 1..7;

for my $permutation (@permutations) {
    my $box1 = $permutation->[0] + $permutation->[1];
    my $box2 = $permutation->[1] + $permutation->[2] + $permutation->[3];
    my $box3 = $permutation->[3] + $permutation->[4] + $permutation->[5];
    my $box4 = $permutation->[5] + $permutation->[6];

    if ($box1 == $box2 && $box2 == $box3 && $box3 == $box4) {
        for my $i (0 .. scalar @{$permutation} - 1) {
            say $labels[$i],  ' = ', $permutation->[$i];
        }
        print "\n"
    }
}
