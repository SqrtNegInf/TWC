#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(max sum);
use Test2::V0 -no_srand;

is(max_freq(1, 2, 2, 4, 1, 5), 4, 'Example 1');
is(max_freq(1, 2, 3, 4, 5), 5, 'Example 2');
done_testing();

sub max_freq
{
     my @arr = @_;
     my %freq;
     do { $freq{$_}++ } for @arr;
     my $max_freq = max(values %freq);
     return sum(grep $_ == $max_freq, values %freq);
}
