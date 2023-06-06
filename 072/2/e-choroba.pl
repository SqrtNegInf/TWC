#!/usr/bin/env perl
use v5.36;

my ($from, $to) = (3, 6);
while (<DATA>) {
    print if ($. == $from) .. ($. == $to);
}

__END__
L1
L2
L3
L4
L5
L6
L7
L8
L9
