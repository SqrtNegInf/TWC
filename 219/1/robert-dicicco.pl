#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my @list = ([-2, -1, 0, 3, 4],
            [5, -4, -1, 3, 6]
            );
my $cnt = (scalar @list) ;

while ($cnt--) {
    say "Input: \@list = [@{$list[$cnt]}]";
    my @squared_array = map { $_ ** 2 } @{$list[$cnt]};
    my @sorted = sort { $a <=> $b } @squared_array;
    print "Output: ",join(", ", @sorted), "\n\n";
}
