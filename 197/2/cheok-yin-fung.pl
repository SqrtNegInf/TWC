#!/usr/bin/env perl

use v5.36;
sub ws {
    my @a = @_;
    for my $i (0..$#a-1) {
        ($a[$i], $a[$i+1]) = ($a[$i+1], $a[$i])
          if ($a[$i] < $a[$i+1] && $i % 2 == 1)
                    ||
             ($a[$i] > $a[$i+1] && $i % 2 == 0);
    }
    return @a;
}

say join ",", ws(1,5,1,1,6,4);
say join ",", ws(1,3,2,2,3,1);
