#!/usr/bin/env perl

use v5.30;
use warnings;
use utf8; #::all;

sub count_inner_chars {
    my ($S) = @_;
    my @a   = split /\s+/, $S;
    length join '', splice @a, 1, -1;
}

say count_inner_chars("Markmið lífs okkar er að vera hamingjusöm");
