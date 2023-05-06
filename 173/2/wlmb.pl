#!/usr/bin/env perl
use v5.36;
use bigint;
my $N=10;
my $s=2;
say $s=$s*($s-1)+1 foreach(1..$N-1);
