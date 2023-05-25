#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $verbose = 0;

GetOptions("verbose" => \$verbose);

my $N = 3;

die "Specify a positive integer" unless $N =~ /^[1-9]\d*$/;

my @result;

traverse(0, 0, "", $N);

sub traverse ($row, $col, $path, $size)
{
  if ($row == $col && $row == $size)
  {
    push(@result, $path);
    return;
  }

  traverse($row,    $col +1, $path . "H", $size) if $col < $row;
  traverse($row +1, $col +1, $path . "R", $size) if $col < $size;
  traverse($row +1, $col,    $path . "L", $size) if $row < $size;
}

say join(", ", @result);

say ": Number of paths: " . scalar @result if $verbose;
