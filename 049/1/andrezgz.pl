#!/usr/bin/env perl
use v5.36;

my $n = 55;

my $m = $n;
$m += $n while ($m !~ /^[01]+$/);
print $m;
