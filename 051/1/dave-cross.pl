#!/usr/bin/env perl
use v5.36;

my $target = 0;

my @numbers = sort { $a <=> $b } grep { /^-?\d+$/  } (-25, -10, -7, -3, 2, 4, 8, 10);

die "Usage: $0 [list of integers]\n" unless @numbers;

for my $i (0 .. $#numbers - 1) {
  my $x     = $numbers[$i];
  my $start = $i + 1;
  my $end   = $#numbers;

  while ($start < $end) {
    my $y = $numbers[$start];
    my $z = $numbers[$end];

    if ($x + $y + $z == $target) {
      say "($x, $y, $z)";
      $start++;
      $end--;
    } else {
      if ($x + $y + $z > $target) {
        $end--;
      } else {
	$start++;
      }
    }
  }
}
