#!/usr/bin/env raku

for [3, [1,4,2,3,5]], [4, [9,0,6,2,3,8,5]] -> $test {
    my $i = $test[0];
    my @nums = |$test[1];
    say "i = $i; nums = @nums[] => ", grep { $_ > $i }, @nums;
}
