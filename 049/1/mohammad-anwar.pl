#!/usr/bin/env perl

use strict;
use warnings;

my $num = 55;
die "Missing number.\n" unless defined $num;

my ($res, $i);
do { $res = $num * ++$i; } until ($res =~ /^[01]+$/);
print "$num => $res\n";
