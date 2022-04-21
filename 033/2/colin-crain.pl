#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## CONFIG

## this is specified by the challenge to 11, for an 11x11 times table, but can be set in this version to any positive integer
my $range = shift @ARGV // 11;         ## change the 11 here or use a command line argument

## ## ## ## ## MAIN

draw_times_table($range);

say "\n";

## or, alternately:
cheap_and_dirty();




## ## ## ## ## SUBS

sub draw_times_table {
    my $range = shift;

    ## autoscaling calculations:
    ##  we need to gather some basic spatial characteristics of the table we will draw
    my $space   = scalar( split //, ($range * $range) ) + 1;    ## count of chars required to fit largest number_format + 1 extra
    my $digits  = scalar( split //, ($range) ) + 1;             ## count of chars taken by the original specified range number + 1 extra
    my $product_format  = '%' . $space  . 'd';                  ## the format substring to print the largest product within the correct width
    my $number_format   = '%' . $digits . 'd';                  ## the format substring to print a factor within the correct width

    ## draw the table:
    for my $i (1..$range) {
        ## header index and dashed line
        if ( $i == 1) {
           my $format  =    (" " x ($digits-1)) . "x|" .   ((" " x $space) x ($i-1)) . ($product_format) x ($range - ($i-1)) . "\n";
           my $dash_format =  ("-" x ($digits)) .  "+" .   (("-" x $space) x $range)                                         . "\n";
           printf "$format", (map { $i * $_ } ($i..$range));
           printf "$dash_format";
        };
        ## table rows
        my $format     =          $number_format .  "|" .   ((" " x $space) x ($i-1)) . ($product_format) x ($range - ($i-1)) . "\n";
        printf "$format", $i, (map { $i * $_} ($i..$range));
    }
}

sub cheap_and_dirty {
say<<__END__
  x|   1   2   3   4   5   6   7   8   9  10  11
---+--------------------------------------------
  1|   1   2   3   4   5   6   7   8   9  10  11
  2|       4   6   8  10  12  14  16  18  20  22
  3|           9  12  15  18  21  24  27  30  33
  4|              16  20  24  28  32  36  40  44
  5|                  25  30  35  40  45  50  55
  6|                      36  42  48  54  60  66
  7|                          49  56  63  70  77
  8|                              64  72  80  88
  9|                                  81  90  99
 10|                                     100 110
 11|                                         121
__END__
}
