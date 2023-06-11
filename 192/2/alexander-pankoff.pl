#!/usr/bin/env perl
use v5.36;

use List::Util qw(reductions sum0);

use Test::More tests => 5;

is( equal_distribution( 1, 0, 5 ), 4,  "Example 1" );
is( equal_distribution( 0, 2, 0 ), -1, "Example 2" );
is( equal_distribution( 0, 3, 0 ), 2,  "Example 3" );
is( equal_distribution(),          0,  "Example (empty list)" );
is( equal_distribution(1),         0,  "Example (singleton list)" );

sub equal_distribution (@list) {
    return 0 if @list <= 1;
    my $total = sum0(@list);
    return -1 if $total % @list != 0;
    my $target = $total / @list;

    sum0 map { abs($_) } reductions { $a + $b - $target } 0, @list;
}

