#!/usr/bin/env perl

use v5.36;

# some examples
my @lists = (
   [1,2,3,1,1,3],
   [1,2,3],
   [1,1,1,1],
   [],
   [1,2,3,4,1,2,3,1,2,1]
);

foreach my $list (@lists) {
   find_good_pairs(@$list);
}


sub find_good_pairs {
   my @list = @_;
   my $count = 0;
   foreach my $i (0..$#list) {
      foreach my $j ($i+1..$#list) {
         $count++ if $list[$i] == $list[$j];
      }
   }
   print "[" . join(",",@list) . "] returns $count\n";
}
