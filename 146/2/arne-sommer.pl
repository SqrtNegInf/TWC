#!/usr/bin/env perl
use v5.36;

my $fraction = '3/5';#$ARGV[0] // "";

die "Not a fraction: $fraction" unless $fraction =~ /^\d+\/\d+$/;

my $parent      = parent($fraction);
my $grandparent = parent($parent);

say "parent = \'$parent\' and grandparent = \'$grandparent\'";

sub parent ($fraction)
{
  my ($numerator, $denominator) = split("/", $fraction);
  
  return "0/0" if $numerator == 1 && $denominator == 1;

  $numerator < $denominator
    ? return $numerator . "/" . ( $denominator - $numerator )
    : return ($numerator - $denominator ) . "/" . $denominator;
}
