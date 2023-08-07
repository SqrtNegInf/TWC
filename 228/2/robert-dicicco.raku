#!/usr/bin/env raku
use v6;

my @myints = ([3, 4, 2],[1,2,3]);

for (@myints) -> @i {
    say "Input: \@int = ",@i;
    my $cnt = 0;
    while @i.elems {
        my $min = @i.min;
        if (@i[0] == $min) {
            @i.shift;
        } else {
            @i.push: @i[0];
            @i.shift;
        }
        @i.elems > 0 ?? say @i !! say "()";
        $cnt++;
    }
    say "Output: $cnt\n";
}
