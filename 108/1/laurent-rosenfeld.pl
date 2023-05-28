#!/usr/bin/env perl
use v5.36;

my $i = 42;
my $ref = \$i;
my $addr = $1 if $ref =~ /\((0x\w+)/;
say $addr;
