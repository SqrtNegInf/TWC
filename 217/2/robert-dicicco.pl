#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Algorithm::Permute;

my @list = ([5,11,4,1,2],[31, 2, 4,10],[10,3,2],[1, 23],[1,10]);
my $max = 0;

for my $lst (@list) {
    print("Input: \@list = [@$lst]\n");
    my $p_iterator = Algorithm::Permute->new ( $lst );
    while (my @perm = $p_iterator->next) {
        my $num = join("",@perm);
        if ($num > $max) {
            $max = $num;
        }
    }
    print("Output: $max\n\n");
    $max = 0;
}
