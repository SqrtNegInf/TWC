#!/usr/bin/env raku
unit sub MAIN(UInt $M = 100, UInt $N = 500);

my $gcd = $M gcd $N;

say (1..$gcd).grep($gcd %% *).join(", ").List;
