#!/usr/bin/env perl
use v5.36;

use List::Util qw(all any);

my $verbose; 
my $calculator;

while (@ARGV && substr($ARGV[0],0,2) eq "--")
{
  my $arg = shift(@ARGV);
  if    ($arg eq "--calculator") { $calculator++ }
  elsif ($arg eq "--verbose"   ) { $verbose++    }
}

my $A = shift(@ARGV) // 1;
my $B = shift(@ARGV) // 200;

die "$A: Not a positive integer" unless $A =~ /^\d+$/;
die "$B: Not a positive integer" unless $B =~ /^\d+$/;

die "$A: Out of range" unless $A >= 1  && $A <= 10 ** 15;
die "$B: Out of range" unless $B >= $A && $B <= 10 ** 15;

my %strobo = $calculator
  ? ( 0 => 0, 1 => 1, 2 => 5, 5 => 2, 6 => 9, 8 => 8, 9 => 6 )
  : ( 0 => 0, 1 => 1, 6 => 9, 8 => 8, 9 => 6 );

sub is_strobogrammatic ($number)
{
  # return 0 unless all { split("", $number) eq any {} keys %strobo };

  my $strobo = join("", map { $strobo{$_} // return 0 } split("", reverse($number)) );

  say ": $number -> $strobo" if $verbose;

  return $strobo eq $number;
}

say join(", ", grep { is_strobogrammatic($_) } ($A .. $B));
