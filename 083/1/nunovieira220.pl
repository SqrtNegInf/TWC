#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);

# Input
my $S = "Markmið lífs okkar er að vera hamingjusöm";

# Output
$S =~ s/^[^\s]+\s(.*)\s[^\s]+$/$1/;
$S =~ s/\s//g;

say length($S);
