#!/usr/bin/env perl
use v5.36;

my $verbose;

my $filename = 'input.txt';
my $A = shift(@ARGV) // 3;
my $B = shift(@ARGV) // 6;

die '$A must be an integer >= 1'  unless int($A) == $A && $A >= 1;
die '$B must be an integer >= $A' unless int($B) == $B && $B >= $B;

my $count = 0;

open my $in, $filename or die "$filename: $!";

while (my $line = <$in>)
{
  $count++;

  say ": Considering line $count: $line" if $verbose;

  next if $count < $A;

  print $line;
  
  last if $count == $B;
}

close $in;
