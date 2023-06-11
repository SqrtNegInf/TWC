#!/usr/bin/env perl
use v5.36;

die 'not ok - disabled: output not stable';

use Math::Combinatorics 'combine';
use Array::Set 'set_diff';
use List::Util 'sum';

my @set = (10, -15, 20, 30, -25, 0, 5, 40, -5);
divide(@set);


sub divide {
    my(@set) = @_;
    my $goal = sum(@set)/2;
    my $k = int(scalar(@set)/2);
    my @cur_subset;
    my $cur_dist = $goal*2;

    for (combine($k, @set)) {
        my @subset = @$_;
        my $dist = abs(sum(@subset)-$goal);
        if ($dist < $cur_dist) {
            @cur_subset = @subset;
            $cur_dist = $dist;
        }
    }

    my @other_subset = @{set_diff(\@set, \@cur_subset)};
    say "(", join(", ", sort {$a<=>$b} @cur_subset), ")";
    say "(", join(", ", sort {$a<=>$b} @other_subset), ")";
}
