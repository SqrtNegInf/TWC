#!/usr/bin/env perl
use v5.36;

my $prev = '001';
for my $i (3..7)  {
    $prev = $prev . "0" .  reverse map { tr/01/10/r }  $prev;;
    say "$i $prev";
}
