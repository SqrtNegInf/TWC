#!/usr/bin/env raku

sub is-monotonic(@nums) {
    [>=] @nums or [<=] @nums
}

my @nums = (1, 2, 2, 3);
say +is-monotonic(@nums);

@nums = (1, 3, 2);
say +is-monotonic(@nums);

@nums = (6, 5, 5, 4);
say +is-monotonic(@nums);
