#!/usr/bin/env perl
use v5.36;
use Modern::Perl;
use List::Util 'min';

# return an iterator to generate the sequence
# the sequence is a merge of all multiples of 2, 3 and 5
sub hamming_gen {
    # sequences of hamming numbers 2*n, 3*n, 5*n
    my @seq = ([1], [1], [1]);
    my @base = (2, 3, 5);

    return sub {
        # get the smallest of the multiples
        my $n = min($seq[0][0], $seq[1][0], $seq[2][0]);
        for my $i (0..2) {
            # shift used multiples
            shift @{$seq[$i]} if $seq[$i][0] == $n;
            # push next multiple
            push @{$seq[$i]}, $n*$base[$i];
        }
        return $n;
    }
}

my($n) = 20;
my $hamming = hamming_gen();
for (1 .. $n) {
    say $hamming->();
}
