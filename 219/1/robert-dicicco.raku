#!/usr/bin/env raku

my @list = ([-2, -1, 0, 3, 4],
            [5, -4, -1, 3, 6]
            );
my $cnt = @list.elems ;

for (@list) -> @lst {
    say "Input: \@list = ",@lst;
    my @squared_array = map(-> $x {$x ** 2},@lst).sort.join(',');
    say "Output: ",@squared_array,"\n";
}
