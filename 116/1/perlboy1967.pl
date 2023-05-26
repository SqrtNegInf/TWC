#!/usr/bin/env perl
use v5.36;

use POSIX qw(ceil);

use Test::More;

my %tests = (
   '1234' => 1,
   '91011' => 1,
   '102030' => 0,
   '102103104' => 1,
   '123456123458' => 0,
   '8910111213141589101112131416' => 1,
);

foreach my $test (sort keys %tests) {
  printf "Test '$test' failed\n"
    unless is(isNumberSequence($test),$tests{$test});
}

done_testing();

sub isNumberSequence {
  my ($n) = @_;

  my $len = 1;

  do {
    my ($startNumber,$l) = (substr($n,0,$len),$len);
    my ($next,$s) = ($startNumber+1);
    while ($s = substr($n,$l) and $s =~ m#^$next#) {
      return 1 if ($' eq '');
      $l += length($next++);
    } 
    $len++;
  } while ($len <= ceil(length($n)/2));
  
  return 0;
}
