#!/usr/bin/env raku

my $a=0;
my $b=FatRat.new(1,1);
my $e=Rat.new(1);

for ^50 {
  $a++;
  $b/=$a;
  $e+=$b;
  print "$e\n";
}
