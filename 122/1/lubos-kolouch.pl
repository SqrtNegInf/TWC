#!/usr/bin/env perl
use v5.36;

sub print_moving_average {
    my @what = @_;

    return unless @what;

    my $total = $what[0];
    my $pos = 1;
    my $arr_str = $what[0];

    # print the first MA to avoid unnecessary IF in the loop for each number
    print "Average of the first number is $total \n";

    shift(@what);
    # now if Perl only had enumerate...
    for my $i (@what) {
        $pos++;
        $total += $i;
        $arr_str .= "+".$i;
        print "Average of the first $pos numbers (".$arr_str.")/$pos = ".$total/$pos."\n";
    }

    return $total/$pos;

}

use Test::More;


is(print_moving_average(10, 20, 30, 40, 50, 60, 70, 80, 90), 50);
done_testing;
