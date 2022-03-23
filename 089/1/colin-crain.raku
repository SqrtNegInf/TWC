#!/usr/bin/env raku
#
#
#       .raku
#
#
#
#       2020 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN (Int $input where {$input > 0} = 100) ;

my $out = (1..$input).combinations(2)
                     .map({[gcd] |$_})
                     .sum;

say "input $input";
say "sum   $out";
