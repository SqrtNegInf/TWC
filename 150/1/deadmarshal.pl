#!/usr/bin/env perl
use v5.36;

my ($s1, $s2) = (1234, 5678);

sub fibonacci_words{
  my (@arr) = @_;
  do{
    push @arr, $arr[-2] . $arr[-1];
  }while(length $arr[$#arr] < 52);

  return (split //, $arr[$#arr])[50];
}

print fibonacci_words($s1, $s2);
