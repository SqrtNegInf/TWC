#!/usr/bin/env perl
use v5.36;


sub process_sequence {
    my $seq = shift;

    my %counter;

    my %compl = (
        'T' => 'A',
        'A' => 'T',
        'G' => 'C',
        'C' => 'G',
    );

    my $comp_seq = '';


    for my $item (split //, $seq) {
        $counter{$item}++;
        $comp_seq .= $compl{$item};
    }


    print "$comp_seq\n";
    return $comp_seq;
}

use Test::More;

is(process_sequence('GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG'), 'CATTTGGGGAAAAGTAAATCTGTCTAGCTGAGGAATAGGTAAGAGTCTCTACACAACGACCAGCGGC');

done_testing;
