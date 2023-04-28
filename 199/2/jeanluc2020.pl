#!/usr/bin/env perl

use v5.36;

my @examples = (
   [[3,0,1,1,9,7], 7, 2, 3],
   [[1,1,2,2,3],0,0,1]
);

foreach my $example (@examples) {
   my ($list, $x, $y, $z) = @$example;
   find_good_triplets($x, $y, $z, @$list);
}

sub find_good_triplets {
   my ($x, $y, $z, @list) = @_;
   my $count = 0;
   foreach my $i (0..$#list) {
      foreach my $j ($i+1..$#list) {
         foreach my $k ($j+1..$#list) {
            $count++ if abs($list[$i]-$list[$j]) <= $x and abs($list[$j]-$list[$k]) <= $y and abs($list[$i]-$list[$k]) <= $z;
         }
      }
   }
   print "[" . join(",",@list) . "] returns $count\n";
}

