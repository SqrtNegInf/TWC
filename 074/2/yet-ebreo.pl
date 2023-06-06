#!/usr/bin/env perl
use v5.36;

my $p;
for my $c ('ababcabd' =~ /./g) {
    $p .= $c;
    1 while $p=~s/(.)(.*)\1/$2/;
    print ((substr $p,-1) || "#");

}
