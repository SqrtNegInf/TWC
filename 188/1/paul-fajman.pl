#!/usr/bin/env perl

use strict;
use warnings;

my @sets = ( [4,5,1,6], [1,2,3,4], [1,3,4,5], [5,1,2,3],[7,2,4,5] );
my @divisors = (2,2,3,4,4);
my @list;
my ($count, $i, $j);

foreach(@sets) {
  undef($count);
  @list = @{ $_ } ;
  print "Input: \@list = @list, \$k = $divisors[0]\n";
  for ($i=0;$i<$#list+1;$i++) {
    for ($j=$i+1;$j<$#list+1;$j++) {
      $count++ if ($list[$i] + $list[$j]) % $divisors[0] eq 0;
    }
  }
  shift(@divisors);
  print "Output: $count\n\n";
}
