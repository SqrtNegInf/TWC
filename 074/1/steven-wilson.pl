#!/usr/bin/env perl
use v5.36;

use POSIX qw/ floor /;

my @A1 = ( 1, 2, 2, 3, 2, 4, 2 );
say find_majority_element( \@A1 );
my @A2 = ( 1, 3, 1, 2, 4, 5 );
say find_majority_element( \@A2 );

sub find_majority_element {
    my $elements_ref = shift;
    my @elements     = @{$elements_ref};
    my $majority     = floor( scalar @elements / 2 );
    my %count_of_elements;
    map { $count_of_elements{$_}++ } @elements;
    for ( keys %count_of_elements ) {
        if ( $count_of_elements{$_} > $majority ) {
            return $_;
        }
    }
    return -1;
}
