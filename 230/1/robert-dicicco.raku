#!/usr/bin/env raku

my @myints = ([1, 34, 5, 6], [1, 24, 51, 60]);

for (@myints) -> @ints {
    my $str = '';
    say "Input: \@ints = ",@ints;
    for (@ints) -> $digit  {
        $str ~= $digit;
    }
    my @arr = (split("",$str));
    say "Output: ",@arr,"\n";
}
