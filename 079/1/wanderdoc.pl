#!/usr/bin/env perl
use v5.36;

use Test::More;

sub count_set_bits
{
     my $num = $_[0];
     my $set_bits = 0;
     for my $i ( 1 .. $num )
     {

          my $binary = sprintf("%b", $i);
          $set_bits += $binary =~ tr/1/1/;
     }
     return $set_bits;
}
is(count_set_bits(4), 5, 'Example 1');
is(count_set_bits(3), 4, 'Example 2');

done_testing();
