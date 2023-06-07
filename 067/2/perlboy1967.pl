#!/usr/bin/env perl
use v5.36;

my %keypad = (
  1 => ['_', ',', '@'],
  2 => [qw(a b c)],
  3 => [qw(d e f)],
  4 => [qw(g h i)],
  5 => [qw(j k l)],
  6 => [qw(m n o)],
  7 => [qw(p q r s)],
  8 => [qw(t u v)],
  9 => [qw(w x y z)],
);

my $s;

$s = $ARGV[0] // 249;

die "digits '1' .. '9' only please" 
  unless $s =~ m#^[1-9]+$#;

my @list = glob('{'.join('}{', map {join(',', @{$keypad{$_}}) } split(//, $s)).'}');

printf qq{Input: s = '%d'\n}, $s;
printf qq{Output: ["%s"]\n"}, join('", "', @list);
