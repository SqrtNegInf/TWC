#!/usr/bin/env raku

my @nums = (1,2,3,4,5,6,7,8);

my $flag = 0;

say "Input: \@nums = ",@nums;
for @nums.combinations(4) -> @pn {
    my $first = ([+] @pn) / @pn.elems ;
    my @sec = @nums.grep(none @pn);
    my $second = ([+] @sec) / @sec.elems ;
    if $first == $second { $flag = 1};
    say "-----> ("~@pn~') ('~@sec~') '~"  $first : $second"  if $first == $second;
}

$flag == 1 ?? (say "Output: true") !! (say "Output: false");
