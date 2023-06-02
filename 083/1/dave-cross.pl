#!/usr/bin/env perl
use v5.36;

$_ = 'Markmið lífs okkar er að vera hamingjusöm';

unless (defined and /\S+\s+\S+\s+\S+/) {
  die "Your string must include three words\n";
}

s/^\s*\S+\s+//;
s/\s+\S+\s*$//;
s/\s+//g;

say length;
