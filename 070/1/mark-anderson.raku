#!/usr/bin/env raku

sub MAIN(UInt $C where $C >= 1 = 3, 
         UInt $O where $O >= $C = 4, 
         Str  $S where $S.chars >= $C + $O = 'perlandraku') {

    my $N = $S.chars;

    my @S = $S.comb;

    map { @S[$_ % $N, ($_ + $O) % $N] = @S[($_ + $O) % $N, $_ % $N] }, 1..$C;

    say @S.join;
}

sub USAGE {
    note "$*PROGRAM-NAME $*USAGE";

    note '  where $C >= 1, $O >= $C, $S.chars >= $C + $O';

    exit;
}
