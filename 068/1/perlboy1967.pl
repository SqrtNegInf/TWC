#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

sub zeroMatrix :prototype(\@);
sub printMatrix :prototype($\@);

my @matrixes = (
  [
    [1, 0, 1],
    [1, 1, 1],
    [1, 1, 1]
  ],
  [
    [1, 0, 1],
    [1, 1, 1],
    [1, 0, 1]
  ]
);

foreach my $matrix (@matrixes) {
  printMatrix('Input', @$matrix);
  zeroMatrix(@$matrix);
  printMatrix('Output', @$matrix);
}

sub zeroMatrix :prototype(\@) {
  my ($matrix) = @_;

  map { $_ = [map {0} @$_] if (!min @$_); } @$matrix;
}

sub printMatrix :prototype($\@) {
  my ($label, $matrix) = @_;

  print "$label:\n";
  foreach my $row (@$matrix) {
    printf "[%s]\n", join(', ',@$row);
  }
  print "--------------\n";
}
