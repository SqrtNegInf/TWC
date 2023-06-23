#!/usr/bin/env perl
use v5.36;

use 5.010;
use warnings;
use strict;
no warnings 'uninitialized';

my @list = split /[, ]+/, join(',', '1,2,3,4,9,10,14,15,16'); # Be flexible. 1,2, 3 4 ,,5 is OK

my ($last, $start);

my @compact;
for (@list, undef) {
    if ($last and $_ - $last == 1) {
        $start //= $last;
    } else {
        if ($start) {
            push @compact, "$start-$last";
            $start = undef;
        } else {
            push @compact, $last if $last;
        }
    }
    $last = $_;
}

say join(',', @compact);
