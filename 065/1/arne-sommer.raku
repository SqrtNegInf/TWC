#!/usr/bin/env raku

unit sub MAIN (Int $N where $N > 0 = 2, Int $S where $S > 0 = 10, :$verbose);

my $start = 10 ** ($N - 1);
my $stop  = (10 ** $N) -1;

say ": Max Range ($start .. $stop)" if $verbose;

say ($start .. $stop).grep({ $_.comb.sum == $S }).join(", ");
