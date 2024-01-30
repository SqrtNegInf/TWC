#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(sum);
use Test2::V0 -srand => 1;

my $mtr =
[
 [1, 1, 0, 0, 0],
 [1, 1, 1, 1, 0],
 [1, 0, 0, 0, 0],
 [1, 1, 0, 0, 0],
 [1, 1, 1, 1, 1]
];

sub sort_matrix
{
     my $m = $_[0];
     my @output =
          map { $_->[2] }
          sort { $a->[1] <=> $b->[1] or $a->[2] <=> $b->[2] }
          map { [ $m->[$_], sum(@{$m->[$_]}),  $_ ] }
          0 .. $#$m;
     return @output;
}


is([sort_matrix($mtr)], [2, 0, 3, 1, 4], 'Example 1');

$mtr =
[
 [1, 0, 0, 0],
 [1, 1, 1, 1],
 [1, 0, 0, 0],
 [1, 0, 0, 0]
];
is([sort_matrix($mtr)], [0, 2, 3, 1], 'Example 2');

done_testing();
