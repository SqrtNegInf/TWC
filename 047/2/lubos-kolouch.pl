#!/usr/bin/env perl
use v5.36;

my $count = 0;
for (100..10000) {
    if ($_ % int(substr($_,0,1).substr($_,2,1)) == 0) {
        say;
        $count++;
        last if $count == 20;
    }
}

