#!/usr/bin/env perl
use v5.36;

my $str = join(" ", 1..50);

while ($str =~ m(^(\S+) (\S+) (.*))) {
    $str = "$3 $1";
}

$str =~ s/ .*//;
say "survivor: $str";
