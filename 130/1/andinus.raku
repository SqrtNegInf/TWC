#!/usr/bin/env raku
#| find integer that appears odd number of times
#sub MAIN(*@nums) {
    my @nums = (2, 5, 4, 4, 5, 5, 2);
    my Bool %seen;
    %seen{$_} = !%seen{$_} for @nums;
    put %seen.grep(*.value).map(*.key);
#}
