#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(first);
use Test::More;

sub majority {
     my @array = @_;
     my $level = int((scalar @array)/2);
     my %count;

     $count{$_}++ for @array;
     return (first { $count{$_} > $level } keys %count) // -1;
}

is(majority(1, 2, 2, 3, 2, 4, 2), 2, 'Example 1');
is(majority(1, 3, 1, 2, 4, 5), -1,   'Example 2');
done_testing();
