#!/usr/bin/env perl
use v5.36;
use English qw/ -no_match_vars /;

sub isIsomorphic {
    my ($A, $B) = @_;

    if (length $A != length $B) {
        return undef;
    }

    my @A = split //, $A;
    my @B = split //, $B;
    my %seen;
    my %isomorphs;

    for my $i (0 .. scalar @A - 1) {
        my $a = $A[$i];
        my $b = $B[$i];

        if (exists $isomorphs{$a}) {
            unless ($b eq $isomorphs{$a}) {
                return undef;
            }
        } else {
            if (!grep /$b/, keys %seen) {
                $isomorphs{$a} = $b;
                $seen{$b} = 1;
            } else {
                return undef;
            }
        }
    }

    return 1;
}

say isIsomorphic('aab', 'ccd') ? 1 : 0;
