#!/usr/bin/env raku
unit sub MAIN( Int $N  = 4);

my $t = 2;
my $r = 0;
my $n = $N;

while $n {
    my Int $a = $t +> 1;
    my Int $s = $N +& ( $t - 1 );
    my Int $d = $N div $t;

    $r  = $r + $d * $a;
    $r  = $r +  1 + $s - $a if 1 + $s > $a;
    $t  = $t +< 1;
    $n  = $n +> 1;
}


say $r % 1000000007;
