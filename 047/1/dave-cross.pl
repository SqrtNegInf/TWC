#!/usr/bin/env perl
use v5.36;

use Roman;

my %ops = (
  '+' => sub { $_[0] + $_[1] },
  '-' => sub { $_[0] - $_[1] },
  '/' => sub { $_[0] / $_[1] },
  'x' => sub { $_[0] * $_[1] },
);

my @ARGV = <V + VI>;
my ($l, $op, $r) = @ARGV;

unless (exists $ops{$op}) {
  warn "'$op' is  not a recognised operation\n";
  die 'Valid operations are: ', join(', ', keys %ops), "\n";
}

say Roman( $ops{$op}->(arabic($l), arabic($r)) );
