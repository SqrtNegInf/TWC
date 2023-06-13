#!/usr/bin/env perl
use v5.36;

my $num = 55;
my $x   = 1;

$x++ while ($num * $x) =~ /[^01]/;

say "$num x $x = ", $num * $x;
