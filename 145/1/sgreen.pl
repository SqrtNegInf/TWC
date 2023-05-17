#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

sub main {
    my @first_nums  = <1 2 3> ; #( shift =~ /(-?\d+(?:\.\d+)?)/gm );
    my @second_nums = <4 5 6> ; #( shift =~ /(-?\d+(?:\.\d+)?)/gm );

    if ( @first_nums != @second_nums ) {
        die "Arrays are of different lengths\n";
    }

    my @dots = ();
    my @sums = ();

    foreach my $i ( 0 .. $#first_nums ) {
        push @dots, "($first_nums[$i] × $second_nums[$i])";
        push @sums, $first_nums[$i] * $second_nums[$i];
    }

    say join( ' + ', @dots ), ' => ', join( ' + ', @sums ), ' => ', sum(@sums);
}

main(@ARGV);
