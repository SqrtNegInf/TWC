#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -srand => 1;
use List::Util qw(sum);

is(appearance_33(1,2,3,3,3,3,4,2), 3, 'Example 1');
is(appearance_33(1,1), 1, 'Example 2');
is(appearance_33(1,2,3), 1, 'Example 3');
done_testing();

sub appearance_33
{
     my @arr = @_;
     my %hash;
     do { $hash{$_}++ } for @arr;
     my $sum = sum(values %hash);
     my @output = 
          sort { $a cmp $b }
          grep { $hash{$_} > 33 * $sum / 100 } keys %hash;
     
     return $output[0];
}
