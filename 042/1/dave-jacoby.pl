#!/usr/bin/env perl
use v5.36;

for my $d ( 0 .. 50 ) {
    my $o = sprintf '%o', $d;
    say qq{Decimal $d = Octal $o};
}

