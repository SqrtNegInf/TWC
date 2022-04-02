#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my $p;
for my $c ('ababcabd' =~ /./g) {
    $p .= $c;
    1 while $p=~s/(.)(.*)\1/$2/;
    print ((substr $p,-1) || "#");

}
