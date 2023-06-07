#!/usr/bin/env perl
use v5.36;

use Test::More;

sub swapping
{
     my $string = $_[0];

     my $count = $_[1];
     my $offset = $_[2];
     my $len = length($string);


     my $i = 1;

     while ( $i <= $count )
     {
          (substr($string, $i % $len, 1), substr($string, ($i + $offset) % $len, 1)) =
          (substr($string, ($i + $offset) % $len, 1), substr($string, $i % $len, 1));
          $i++;
     }

     return $string;
}
is(swapping('perlandraku', 3, 4), 'pndraerlaku', 'Example 1');
is(swapping('weeklychallenge', 5, 2), 'wklycheeallenge', 'Example 2');
done_testing();
