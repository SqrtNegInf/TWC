#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

$_ = 'Markmið lífs okkar er að vera hamingjusöm';

unless (defined and /\S+\s+\S+\s+\S+/) {
  die "Your string must include three words\n";
}

s/^\s*\S+\s+//;
s/\s+\S+\s*$//;
s/\s+//g;

say length;
