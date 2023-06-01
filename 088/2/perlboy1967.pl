#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

my $ar = [
  [qw(1 2)],
  [qw(3 4)],
];

my $ar1 = [
  [qw(1 2 3)],
  [qw(4 5 6)],
  [qw(7 8 9)],
];

my $ar2 = [
  [qw( 1  2  3  4)],
  [qw( 5  6  7  8)],
  [qw( 9 10 11 12)],
  [qw(13 14 15 16)],
];

my $hrM = matrix($ar2);

my @O;

my @dirVector = (
  [ 0, 1], 
  [ 1, 0], 
  [ 0,-1],
  [-1, 0]
);

my ($r, $c) = (0, 0);

LOOP:
while (1) {
  push(@O, delete($hrM->{$r}{$c}));

  my $rot = 0;
  while (!exists($hrM->{$r+$dirVector[0][0]}{$c+$dirVector[0][1]})) {
    push(@dirVector, shift(@dirVector));
    $rot++;
    last LOOP if ($rot > 1);
  }

  $r += $dirVector[0][0];
  $c += $dirVector[0][1];
}

#p @O;
print "@O\n";

sub matrix {
  my ($ar) = @_;

  my $m;

  my $r = 0;
  foreach my $row (@$ar) {
    my $c = 0;
    map { $m->{$r}{$c++} = $_ } @$row;
    $r++;
  } 

  return $m;
} 
