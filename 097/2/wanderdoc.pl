#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use List::Util qw(min sum);
use Test::More;

sub count_flips
{
     my ($str, $int) = @_;
     my $length = length($str);

     die "Size mismatch!$/" if ($length % $int or $length <= $int);

     my $format = "a${int}" x ($length/$int);

     my @arr = unpack $format, $str;

     my $min = $length;
     for my $idx ( 0 .. $#arr )
     {
          my $comparing = $arr[$idx];
          my $sum = sum( map { unpack '%32b*', $comparing ^ $_ } 
                         @arr[grep $_ != $idx, 0 .. $#arr] ); 
          $min = $sum if $sum < $min;
     }


     return $min;
}


is(count_flips(qw(101100101), 3), 1, 'Example 1');
is(count_flips(qw(10110111),  4), 2, 'Example 2');
is(count_flips(qw(100111110), 3), 2, 'My Example');


done_testing();
