#!/usr/bin/env perl
use v5.36;

for my $n ( 0 .. 19 ) {
    my $f = ff($n);
    my $m = mm($n);
    # say '';
    say qq{ f( $n ) = $f \t m( $n ) = $m };
}

sub ff( $n ) {
    # print qq{ ff($n) };
    return 1 if $n == 0 ;
    return $n - mm( ff( $n-1 ));
}

# using mm() because m() is a match operator, and using ff() to
# keep consistent, even though there isn't an f() operator.
sub mm( $n ) {
    # print qq{ mm($n) };
    return 0 if $n == 0 ;
    return $n - ff( mm( $n-1 ));
}
