#!/usr/bin/env perl

no warnings;
use strict;
use feature qw{ say };
use Getopt::Long;

sub get_ack {
    my ( $m, $n ) = @_;

    # just copy the definition
    return $n + 1 if $m == 0;
    return get_ack( $m - 1, 1 ) if ( $m > 0 ) and ( $n == 0 );

    return get_ack( $m - 1, get_ack( $m, $n - 1 ) );
}

#### ---------- MAIN -----------

my $m;
my $n;

GetOptions('m=s' => \$m, 'n=s' => \$n) ;

say get_ack( $m, $n );

use Test::More;

is( get_ack( 1, 2 ), 4, 'test if ack 1,2 == 4' );
is( get_ack( 2, 1 ), 5, 'test if ack 2,1 == 5' );

isnt( get_ack( 1, 2 ), 9, 'test if ack 1,2 != 9' );
isnt( get_ack( 2, 1 ), 1, 'test if ack 2,1 != 1' );

done_testing();
