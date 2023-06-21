#!/usr/bin/env perl
use v5.36;

my $s=0;
my $n=1;
print "$s ";

my @lst=(1);

my $os=0;
for (1..20) {
  if (defined $lst[$s]) {
    $s=$n-$lst[$s];
  } else {
    $s=0;
  }
  $lst[$os]=$n;
  $n++;
  print "$s ";
  $os=$s;
}
