#!/usr/bin/env raku

my @nums = ([1,2,2,4],[1,2,3,4],[1,2,3,3]);

for (@nums) -> @a {
    my $found = 0;
    say "Input: \@nums = ",@a;
    my $ln = @a.elems;
    for 0..$ln-1 -> $n {
        if @a[$n] != $n+1 {
           say "Output: (@a[$n],",$n+1,')';
           $found = 1;
        }
    }
    if $found == 0 {
        say "Output: -1";
    }
    say " ";
}
