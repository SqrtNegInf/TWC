#!/usr/bin/env perl
use 5.020;
use warnings;

my $N = shift // 1234;

my $next = $N + 1;
do $next++ until $next == reverse $next;
say $next;
