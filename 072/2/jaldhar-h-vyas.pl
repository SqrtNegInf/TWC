#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my ($A, $B, $file) = (3, 6, 'input.txt');
my $linenumber = 0;

open my $fn, '<', $file or die "$OS_ERROR\n";
while (my $line = <$fn>) {
    $linenumber++;
    if ($linenumber > $B) {
        last;
    }
    if ($linenumber < $A) {
        next;
    }
    print $line;

}
close $fn;
