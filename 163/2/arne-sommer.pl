#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Perl6::Junction 'all';
use List::Util qw(sum);

my $verbose = 0;

GetOptions("verbose" => \$verbose);

my @values = (1,3,5,7,9);

die "Please specify a list of positve integers" unless @values;
die "Integers only" unless qr/^[1-9][0-9]*$/ == all(@values);

while (@values > 1)
{
  say ": @values" if $verbose;

  @values = next_row(@values);
}

say $values[0];

sub next_row (@values)
{
  my @new;
  
  for my $index (1 .. @values -1)
  {
    push(@new, sum(@values[1..$index]));
  }
  return @new;
}
