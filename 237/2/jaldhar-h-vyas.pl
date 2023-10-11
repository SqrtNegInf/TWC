#!/usr/bin/env perl
use v5.36;

sub permute ($code, @words) {
    my @idx = 0..$#words;
    while ( $code->(@words[@idx]) ) {
        my $p = $#idx;
        --$p while $idx[$p-1] > $idx[$p];
        my $q = $p or return;
        push @idx, reverse splice @idx, $p;
        ++$q while $idx[$p-1] > $idx[$q];
        @idx[$p-1,$q]=@idx[$q,$p-1];
    }
}

my @nums = (1, 3, 5, 2, 1, 3, 1);

my $maxGreatness = 0;

my @permutations;
permute sub { push @permutations, \@_ }, @nums;

for my $perm (@permutations) {
    my $greatness = 0;
 
    for my $i (0 .. scalar @{$perm} - 1) {
        if ($nums[$i] < $perm->[$i]) {
            $greatness++;
        }
    }

    if ($greatness > $maxGreatness) {
        $maxGreatness = $greatness;
    }
}

say $maxGreatness;
