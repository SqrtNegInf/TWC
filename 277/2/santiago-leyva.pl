#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use Data::Dumper;
use List::Util qw(min);


my @ints = (1, 2, 3, 4, 5);
my @pairs;
my %seen;
my $key;
my $j;
# 0 < |2-3| < min(2,3)

for(my $i; $i<(scalar @ints); $i++){
    $j = $i+1;
    while($j < (scalar @ints)){
      
      if((abs($ints[$i]-$ints[$j]) > 0) && ((abs($ints[$i]-$ints[$j])) < min($ints[$i],$ints[$j]))){
        $key = $ints[$i].",".$ints[$j];
        if(!exists($seen{$key})){
          $seen{$key} = '';
          push @pairs,[$ints[$i],$ints[$j]];
        }else{}
      }
    $j+=1;
    }
}

foreach(@pairs){
  print Dumper $_;
}
