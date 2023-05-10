#!/usr/bin/env perl
use v5.36;

# as with .raku, answer differs from others

use Getopt::Long;
use Perl6::Junction 'all';
use List::Util qw(sum);
use Algorithm::Combinatorics qw(combinations);

my $verbose = 0;

GetOptions("verbose" => \$verbose);

my @values = <1 2 3 10>;

die "Please specify a list of positve integers" unless @values;
die "Integers only" unless qr/^[1-9][0-9]*$/ == all(@values);

my $sum = 0;

for my $pair (combinations(\@values, 2))
{
  my $and = $pair->[0] & $pair->[1];
  $sum += $and;
  say ": Pair: $pair->[0], $pair->[1] (-> $and)" if $verbose;
}

say $sum;
