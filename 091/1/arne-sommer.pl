#!/usr/bin/env perl
use v5.36;

my $N = shift(@ARGV) || 1122234;

die "Please specify a positive integer" unless $N =~ /^[1-9]\d*$/;

my @input   = split("", $N);
my $current = shift(@input);
my $count   = 1;

while (@input)
{
  if ($input[0] eq $current)
  {
      shift(@input);
      $count++;
  }
  else
  {
    print $count . $current;
    $current = shift(@input);
    $count   = 1;
  }
}

print $count . $current . "\n";
