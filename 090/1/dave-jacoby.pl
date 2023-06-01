#!/usr/bin/env perl
use v5.36;

my $sequence =  'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG' ;
my $complement = $sequence;
$complement =~ tr/TACG/ATGC/;

say <<"END";
    Sequence:   $sequence
    Complement: $complement
END

for my $i ( qw( A T C G ) ) {
    my $n = scalar grep {/$i/} split // , $sequence;
    say qq(    $i: $n );
}


