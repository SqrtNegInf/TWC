#!/usr/bin/env raku

sub SumDigits ( Int $x is copy ) {
    my $sum=0;
    while $x != 0 {
        $sum += $x mod 10;
        $x= $x div 10;
    }
    return $sum;
}


sub MAIN {
    for 0..50 -> $x {
        say $x if $x %% SumDigits($x);
    }
}
