#!/usr/bin/env perl
use v5.36;

my @out;
for (0..19) {
    push @out, leonardo($_);
}
say join(", ", @out);


sub leonardo {
    my($n) = @_;
    if ($n < 2) {
        return 1;
    }
    else {
        return leonardo($n-1)+leonardo($n-2)+1;
    }
}
