#! /usr/bin/env perl
use v5.36;

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use Algorithm::Combinatorics 'permutations';

my $verbose = 0;

GetOptions("verbose" => \$verbose);

my @all;

my @ARGV = (4, 1, 7, 6);
for my $list (permutations(\@ARGV))
{
  my @candidate = @$list;
  my $value     = join("", @candidate);

  next unless $value =~ /[02468]$/;

  push(@all, $value);
}

@all = reverse sort @all;

say ": " . join(", ", @all) if $verbose && @all;

say $all[0] if $all[0] && $all[0] != 0;
