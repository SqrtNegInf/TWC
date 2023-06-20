#!/usr/bin/env perl
use v5.36;

use Date::Calc qw/check_date Day_of_Week Days_in_Month/;

sub has_5_weekends {
    my ( $year, $month ) = @_;

    my $days = Days_in_Month( $year, $month );

    my %wdays;

    for my $day ( 1 .. $days ) {
        $wdays{ Day_of_Week( $year, $month, $day ) }++;
    }

    return 1 if ( $wdays{5} == 5 ) and ( $wdays{6} == 5 ) and ( $wdays{7} == 5 );

    return 0;
}

###### MAIN ######

my $count;

for my $year ( 1900 .. 2019 ) {
    for my $month ( 1 .. 12 ) {
        $count++ if has_5_weekends( $year, $month );
    }

}

say "There are $count months";
###### TESTS ######

use Test::More;

say 'TESTS:';

is( has_5_weekends( 2019, 7 ), 0, 'Test 2019/07' );
is( has_5_weekends( 2019, 3 ), 1, 'Test 2019/03' );

done_testing;
