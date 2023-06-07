#!/usr/bin/env perl
use v5.36;

my $input = '[1 0 1] [1 1 1] [1 1 1]';

my @old;
my @new;

my $cols;
my $rows = 0;

for my $row (split(/\[/, $input))
{
  next unless $row;
  $row =~ tr/\]//d;
  $row = $1 if $row =~ /^\s*(.*?)\s*$/;
  my @values = split(/\s+/, $row);

  for (@values) { die "Only '0' and '1' please" unless $_ eq "0" || $_ eq "1"; }

  if (defined $cols)
  {
    die "Not the same number of elements in all the rows" unless $cols == @values;
  }
  else
  {
    $cols = @values;
  }

  my @copy = @values;    # As we use a reference in the «push».
  
  push(@old, \@values);
  push(@new, \@copy);
  $rows++;
}

for my $row (0 .. $rows -1)
{
  for my $col (0 .. $cols -1)
  {      
    if ($old[$row][$col] == 0)
    {
      for my $a (0 .. $rows-1)
      {
        $new[$row][$a] = 0;
      }
      
      for my $b (0 .. $cols-1)
      {
	$new[$b][$col] = 0;
      }
    }
  }
}

say "[", join(", ", @{$_}), "]" for @new;
