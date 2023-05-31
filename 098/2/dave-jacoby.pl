#!/usr/bin/env perl
use v5.36;

my @ns;
push @ns, [ 3,  [ 1,  2,  3,  4 ] ];
push @ns, [ 6,  [ 1,  3,  5,  7 ] ];
push @ns, [ 10, [ 12, 15, 16, 18 ] ];
push @ns, [ 19, [ 11, 13, 15, 17 ] ];

for my $m (@ns) {
    my $n = $m->[0];
    my @n = $m->[1]->@*;
    my $i = search_insert_position( $n, @n );
    say qq{Input:  \$n = $n};
    say qq{        \@n = } . join ', ', @n;
    say qq{Output: \$i = $i};
    say '';
}

sub search_insert_position ( $n, @n ) {
    my $i = 0;
    while ( $i < @n ) {
        return $i if $n <= $n[$i];
        $i++;
    }
    return $i;
}
