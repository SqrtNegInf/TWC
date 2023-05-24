#! /usr/bin/env perl
use v5.36;

use Getopt::Long;
use Scalar::Util qw(looks_like_number);

my $verbose = 0;

GetOptions("verbose" => \$verbose);

#die "Please specify a list of numbers" unless @ARGV;

my $sum   = 0;
my $count = 0;

my @result;
my @verbose;

for my $current ( (10, 20, 30, 40, 50, 60, 70, 80, 90, 100) )
{
  die "$current: Not a numeric value" unless looks_like_number($current);

  $sum += $current;
  
  my $avg = $sum / ++$count;
  push(@result, $avg);

  push(@verbose, "Average of first " .
      ( $count == 1 ? "number" : "$count numbers" ) .
      " (" . join("+", @ARGV[0 .. $count -1]) . ")/$count = $avg") if $verbose;
}

$verbose && say $_ for @verbose;

say join(", ", @result);
