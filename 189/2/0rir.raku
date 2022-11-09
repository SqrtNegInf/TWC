#!/usr/bin/env raku

use Test;

sub shortest-degree-slice( @list --> Array ) {
    my @by-ct = @list.BagHash.antipairs;
    my $most-common-qty = max( map( *.key, @by-ct));
    my @common-value = map( *.value, grep( *.key == $most-common-qty, @by-ct));
    my ($head, $tail) = 0, @list.end;
    for @common-value.reverse -> $e {
        my $hd = @list.first( * == $e, :k);
        my $tl = @list.first( * == $e, :end, :k);
        ($head, $tail) = ($hd, $tl) if $tail - $head ≥  $tl - $hd;
    }
    @list[ $head .. $tail].Array;
}

sub MAIN() {
    my @Test =
        { array => (1, 2, 1, 2, 1, 1), :exp(1, 2, 1, 2, 1, 1), },
        { array => (1, 3, 3, 2), :exp(3, 3), },
        { array => (1, 2, 1, 3), :exp(1, 2, 1), },
        { array => (1, 3, 2, 1, 2), :exp(2, 1, 2), },
        { array => (1, 1, 2, 3, 2), :exp(1, 1), },
        { array => (2, 1, 2, 1, 1), :exp(1, 2, 1, 1), },
        #{ array => (2, 2, 1, 1, 3), :exp(2, 2), },      # ???
    ;

    plan +@Test;
    for @Test -> %t {
        is shortest-degree-slice( %t<array>), %t<exp>, "%t<array> -> %t<exp>";
    }
    done-testing;
}
