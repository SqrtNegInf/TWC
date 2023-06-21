#!/usr/bin/env perl
use v5.36;

use bigint;

sub A($m, $n) {
    return $n + 1 if !$m;

    if ( $m > 2 ) {
        # Shortcut based on Wikipedia!
        my $ret = 2;
        $ret = up_arrow(2, $m-2, $n+3); 
        return $ret - 3;
    }

    return A($m-1, 1) if !$n;
    return A($m-1, A($m, $n-1));
}

sub up_arrow($m, $num_arrows, $n) {
    no warnings 'recursion';
    return 1 unless $n;
    return $m ** $n if $num_arrows == 1;

    @_ = ($m, $num_arrows-1, up_arrow($m, $num_arrows, $n-1));  # DH warning with v5.36
    goto &up_arrow;
}

say A(0,0);
say A(1,0);
say A(1,1);
say A(1,2);
