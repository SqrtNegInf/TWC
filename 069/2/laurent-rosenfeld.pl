#!/usr/bin/env perl
use strict;
use warnings;
use feature qw /say/;

my $prev = '001';
for my $i (3..7)  {
    $prev = $prev . "0" .  reverse map { tr/01/10/r }  $prev;;
    say "$i $prev";
}
