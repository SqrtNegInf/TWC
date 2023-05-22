#!/usr/bin/env raku

my @list = ([5,11,4,1,2],[31, 2, 4,10],[10,3,2],[1, 23],[1,10]);
my $max = 0;

for (@list) -> @lst {
    print("Input: @list = ",@lst,"\n");
    for @lst.permutations -> $p {
        my $num = $p.join;
        if $num > $max {
            $max = $num;
        }
    }
    say "Output: $max\n";
    $max = 0;
}
