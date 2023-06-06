#!/usr/bin/env perl
use v5.36;

use Math::BigInt;

my ($N) = 20;

die "Argument must be positive number"
  unless (defined $N and $N =~ m#^[1-9][0-9]*$#);

my $tzNum = 0;
my $b = Math::BigInt->new($N)->bfac->as_int;
if ($b =~ m#([0]+)$#) {
  $tzNum = length($1);
}

print "Input: $N\n";
print "Output: $tzNum\n";
