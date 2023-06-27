#!/usr/bin/env perl
use v5.36;

use File::Spec;
use FindBin;
use List::Util qw(min sum);

use constant DEBUG => $ENV{DEBUG} // 0;

say join( ', ', generate_ulam_sequence( 1, 2 ) );

sub generate_ulam_sequence ( $u, $v, $length = 10 ) {
    my @sequence = ( $u, $v );
    my @sums     = ( $u + $v );

    while ( @sequence < $length ) {
        @sums = grep { $_ > $sequence[-1] } @sums;
        my @unique_sums = remove_dupes(@sums);
        my $new         = min(@unique_sums);
        push @sums, ( map { $_ + $new } @sequence );
        push @sequence, $new;
    }

    return @sequence;
}

sub remove_dupes(@xs) {
    my %count;
    $count{$_}++ for @xs;
    return grep { $count{$_} == 1 } keys %count;
}

