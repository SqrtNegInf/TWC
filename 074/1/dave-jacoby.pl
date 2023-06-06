#!/usr/bin/env perl
use v5.36;

use List::Util qw{ first };

my @array;
push @array, [ 1, 2, 2, 3, 2, 4, 2 ];
push @array, [ 1, 3, 1, 2, 4, 5 ];

for my $i (@array) {
    my $output = majority_element( $i->@* );
    print 'Input: @A = (';
    print  join ', ', $i->@*;
    say ')';
    say qq{Output: $output};
    say '';
}

sub majority_element ( @array ) {
    my $floor = scalar @array / 2;
    my %hash;
    map { $hash{$_}++ } @array;

    for my $k ( sort { $hash{$b} <=> $hash{$a} } keys %hash ) {
        my $v = $hash{$k};
        return $k if $v > $floor;
    }

    return -1;
}

