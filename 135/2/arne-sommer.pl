#!/usr/bin/env perl
use v5.36;

my $SEDOL = $ARGV[0] // "B0YBKL9";

die "SEDOL with wrong length and/or characters"
  unless $SEDOL =~ /^[0-9|BCDFGHJKLMNPQRSTVWXYZ]{6}[0-9]$/;

my @weight = (1, 3, 1, 7, 3, 9, 1);

my @alphabet = (0..9, 'A'..'Z');

my %alphabet = ( map { $alphabet[$_] => $_ } (0 .. @alphabet -1));

my $sum;

for my $index (0..5)
{
   $sum += $alphabet{ substr($SEDOL, $index, 1) } * $weight[$index];
}

my $check = (10 - ($sum % 10)) % 10;

say 0 + (substr($SEDOL, 6) eq $check);
