#!/usr/bin/env perl
use v5.36;

my $pie_left    = 1;
my $max_portion = 0;

sub get_portion {
    my $pie = shift;
    my $n   = shift;

    return $pie * $n / 100;
}

for my $n (1..100) {

    my $portion = get_portion( $pie_left, $n );

    if ( $portion < $max_portion ) {
        $n--;
        say 'Biggest portion has guest '. $n .' , portion size '.sprintf("%.2f%%\n",$max_portion*100);
        last;
    }

    $max_portion = $portion;
    $pie_left -= $portion;
}

use Test::More;

is( get_portion( 1, 1 ), 0.01, 'test if rest 1 == 0.01' );
is( get_portion( 2, 99 / 100 ), 99 / 100 * 2 / 100, 'test if rest 2 == 0.02*99' );

done_testing();
