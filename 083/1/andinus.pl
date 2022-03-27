#!/usr/bin/env perl

use strict;
use warnings;

my @words = split / /, 'Markmið lífs okkar er að vera hamingjusöm';
shift @words;
pop @words;

my $len;
$len += length($_) foreach @words;

print $len, "\n";
