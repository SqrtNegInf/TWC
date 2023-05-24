#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use Algorithm::Permute;
 
my $verbose = 0;

#GetOptions("verbose" => \$verbose);

#my $matrix = $ARGV[0] // die "Please specify a matrix";

my $matrix = "0 5 2 7 | 5 0 5 3 | 3  1  0  6 | 4  5  4  0";

my @NN;

for my $row (split(/\s*\|\s*/, $matrix))
{
  my @cols = split(/\s+/, $row);
  push(@NN, \@cols);
}

my $size = @NN;

if ($verbose)
{
  for my $from (0 .. $size -1)
  {
    for my $to (0 .. $size -1)
    {
      next if $from == $to;
      say ": Distance from city #$from to #$to: " . $NN[$from][$to];
    }
  }
}

say "" if $verbose;

my %solutions;
my %seen;

my @p2 = 0 .. $size -1;

my $p_iterator = Algorithm::Permute->new ( \@p2 );

PERM:
while (my @path = $p_iterator->next)
{
  my $candidate = join(" ", @path);

  my @p = @path;

  for (1 .. $size)
  {
    push(@p, shift @p);
      
    next PERM if $seen{ join(" ", @p) };
  }

  $seen{$candidate} = 1;
    
  push(@path, $path[0]);
  my @path2 = @path;

  my $from   = shift @path;
  my $length = 0;
  
  while (@path)
  {
    my $to = shift @path;
    $length += $NN[$from][$to];
    say ": " . join(" ", @path2) . " | $from -> $to = " . $NN[$from][$to] . " (sum $length)" if $verbose;
    $from = $to;
  }
  say "" if $verbose;
  
  $solutions{$length} = \@path2 unless $solutions{$length};
}

if ($verbose)
{
  for my $length (sort { $a cmp $b } keys %solutions)
  {
    for my $path ($solutions{$length})
    {
      say ": $length - [ " . join(" ", @{$path}) . " ]";
    }
  }
}

my @lengths = sort { $a cmp $b } keys %solutions;

my $length = $lengths[0];

say "length = $length";
say "tour = (" . join(" ", @{$solutions{$length}}) . ")";

