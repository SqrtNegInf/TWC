#!/usr/bin/env perl
use v5.36;
use List::Util qw(all);

use constant DEBUG => $ENV{DEBUG} // 0;

for ( 2,4,8 ) {
    my @cuties = cute_list($_);
    say '$n = ' . sprintf( "%2d", $_ ) . ": " . scalar @cuties;

    if (DEBUG) {
        say "  " . join( ", ", @$_ ) for @cuties;
    }
}

sub cute_list ( $size, $index = 1, $acc = [] ) {
    return $acc if $index > $size;

    my @xs         = 1 .. $size;
    my @candidates = grep { $_ % $index == 0 || $index % $_ == 0 } @xs;

    my @out;
    for my $candidate (@candidates) {
        if ( !grep { $candidate == $_ } @$acc ) {
            push @out, cute_list( $size, $index + 1, [ @$acc, $candidate ] );
        }
    }

    return @out;
}

