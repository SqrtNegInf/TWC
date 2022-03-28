#!/usr/bin/env perl

use Modern::Perl;

my ( $M, $N ) = (100, 500);

my %factors;
for ( $M, $N ) {
    for my $f ( factor($_) ) {
        $factors{$_}++ for $f->@*;
    }
}

my @common_factors;
for my $f (sort keys %factors) {
    push @common_factors, $f if $factors{$f} == 2;
}

say sprintf "(%s)", join ', ', @common_factors;

sub factor
{
    my $n = shift;
    my @factors;
    for my $f ( 1 .. int( $n / 2 ) ) {
        push @factors, $f unless $n % $f;
    }
    return \@factors;
}
