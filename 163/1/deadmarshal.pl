#!/usr/bin/env perl
use strict;
use warnings;

sub sum_bitwise_operator{
  my ($arr) = @_;
  my $sum = 0;
  for(my $i = 0; $i < @$arr; ++$i){
    for(my $j = $i+1; $j < @$arr; ++$j){
      $sum += $arr->[$i] & $arr->[$j];
    }
  }
  $sum;
}

my @n1 = (1,2,3);
my @n2 = (2,3,4);
my @n3 = (1,2,3,10);

print sum_bitwise_operator(\@n1), "\n";
print sum_bitwise_operator(\@n2), "\n";
print sum_bitwise_operator(\@n3), "\n";
