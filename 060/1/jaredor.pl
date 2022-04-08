#!/usr/bin/env perl

use v5.012;
use warnings;
use integer;
use List::Util qw(reduce all);

# PWC 060, TASK #1 : Excel Column

my ( @alpha, %trans ) = ( 'A' .. 'Z', );
@trans{ @alpha, keys @alpha } = ( keys(@alpha), @alpha, );

sub num_to_col {
    my ( $num, @col ) = ( $_[0], );
    push @col, ( $num - 1 ) % 26 and $num = ( $num - 1 ) / 26 while $num;
    return join( '', reverse @trans{@col} );
}

sub col_to_num {
    return 1 + reduce { 26 * ( $a + 1 ) + $b } @trans{ split( '', $_[0] ) };
}

my @inargs = (28);

for my $inarg (@inargs) {
    my $type   = $inarg =~ /\d/    ? 'Number'          : 'Column Name';
    my $output = $type eq 'Number' ? num_to_col $inarg : col_to_num $inarg;
    say "\nInput $type: $inarg\nOutput: $output";
}
