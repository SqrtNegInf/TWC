#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my ($A, $B, $C) = ('XXY', 'XXZ', 'XXXXZY');
my $result;
my $copy = $C;

while (length $A || length $B) {
    "$A\0$copy" =~ /\A (.*) .* \0 \1/msx;
    my $prefixa = $1;
    $result .= $prefixa;
    $A =~ s/\A $prefixa//msx;
    $copy =~ s/\A $prefixa//msx;

    "$B\0$copy" =~ /\A (.*) .* \0 \1/msx;
    my $prefixb = $1;
    $result .= $prefixb;
    $B =~ s/\A $prefixb//msx;
    $copy =~ s/\A $prefixb//msx;
}

say $result eq $C ? 1 : 0;
