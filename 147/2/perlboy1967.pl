#!/usr/bin/env perl
use v5.36;

sub pentagonNumber {
  $_[0]*(3*$_[0]-1) >> 1;
}

my @p = (undef);
my %pIdx;

my $i = 1;

while (1) {
  push(@p,pentagonNumber scalar @p);
  $pIdx{$p[-1]} = scalar @p - 1;

  foreach my $j (1 .. $i-1) {
    my $dif = $p[$i] - $p[$j];
    next if !exists $pIdx{$dif};

    my $sum = $p[$i] + $p[$j];

    while ($p[-1] <= $sum) {
      push(@p,pentagonNumber scalar @p);
      $pIdx{$p[-1]} = scalar @p - 1; 
    }

    if (exists $pIdx{$sum}) {
      printf "P(%d) + P(%d) = %d + %d = %d = P(%d)\n",
             $i, $j, $p[$i], $p[$j], $sum, $pIdx{$sum};
      printf "P(%d) - P(%d) = %d - %d = %d = P(%d)\n",
             $i, $j, $p[$i], $p[$j], $dif, $pIdx{$dif};
      exit;
    } 
  }
  $i++;
}
