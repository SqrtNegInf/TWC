#!/usr/bin/env perl
use v5.36;
use Lingua::EN::Numbers qw(num2en);

sub four_is_magic{
  my ($n) = @_;
  my @arr;
  my $len = length(num2en($n));
  do{
    push @arr, num2en($n) . ' is ' . num2en($len);
    $n = $len;
    $len = length(num2en($n));
  }until($n == 4);
  push @arr, "four is magic.";
  return ucfirst join ', ', @arr;
}

print four_is_magic(5);
print four_is_magic(9);
