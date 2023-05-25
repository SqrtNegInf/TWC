#!/usr/bin/env perl
use v5.36;

for my $n ( 0 .. 20 ) {
    say join "\t", '', $n, flopped($n);
}

    say join "\t", '', 86, flopped(86);
    say join "\t", '', 101, flopped(101);
    say join "\t", '', 18, flopped(18);
    say join "\t", '', 33, flopped(33);

sub flopped ($n) {
    my $b = sprintf '%08b', $n;
    my $c = join '', substr( $b, 4, 4 ), substr( $b, 0, 4 );
    my $r = oct( '0b' . $c );
    return $r;
}

