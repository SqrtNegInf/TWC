#!/usr/bin/env perl
use strict;
use warnings;

use Test2::V0 -no_srand;

is(string_score('hello'), 13, 'Example 1');
is(string_score('perl'), 30, 'Example 2');
is(string_score('raku'), 37, 'Example 3');
done_testing();



sub string_score
{
     my $str = $_[0];
     my %ascii = map { chr($_) => $_ } 32 .. 126;
     my @arr = map $ascii{$_}, split(//, $str);
     my $score = 0;
     for my $idx ( 0 .. $#arr - 1 )
     {
          $score += abs($arr[$idx] - $arr[$idx + 1]);
     }
     return $score;
}
